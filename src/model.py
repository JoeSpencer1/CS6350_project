import csv
import random
import deepxde as dde
import numpy as np
import pandas as pd
from scipy import optimize 
from data import FileData
import tensorflow as tf

def Pi1(Er_sigma33):
    x = np.log(Er_sigma33)
    return -1.131 * x ** 3 + 13.635 * x ** 2 - 30.594 * x + 29.267


def Pi2(Er_sigma33, n):
    x = np.log(Er_sigma33)
    return (
        (-1.40557 * n ** 3 + 0.77526 * n ** 2 + 0.1583 * n - 0.06831) * x ** 3
        + (17.93006 * n ** 3 - 9.22091 * n ** 2 - 2.37733 * n + 0.86295) * x ** 2
        + (-79.99715 * n ** 3 + 40.5562 * n ** 2 + 9.00157 * n - 2.54543) * x
        + 122.65069 * n ** 3
        - 63.88418 * n ** 2
        - 9.58936 * n
        + 6.20045
    )

def Pi4(hrhm):
    return 0.268536 * (0.9952495 - hrhm) ** 1.1142735


def Pi5(hrhm):
    return 1.61217 * (
        1.13111 - 1.74756 ** (-1.49291 * hrhm ** 2.535334) - 0.075187 * hrhm ** 1.135826
    )

def Pitheta(theta, Er_sigma):
    Ersig = np.log(Er_sigma)
    t1 = (-2.3985e-5 * theta ** 3 + 6.0446e-4 * theta ** 2 +0.13243 * theta - 5.0950)
    t2 = (0.0014741 * theta ** 3 - 0.21502 * theta ** 2 + 10.4415 * theta - 169.8767)
    t3 = (-3.9124e-3 * theta ** 3 + 0.53332 * theta ** 2 - 23.2834 * theta + 329.7724)
    t4 = (2.6981e-3 * theta ** 3 - 0.29197 * theta ** 2 + 7.5761 * theta + 2.0165)
    return t1 * Ersig ** 3 + t2 * Ersig ** 2 + t3 * Ersig + t4


def epsilon_r(theta):
    return 2.397e-5 * theta ** 2 - 5.311e-3 * theta + 0.2884


def forward_model(E, n, sy, nu, Pm=None, hm=None, nu_i=0.0691, E_i=1143e9, typ='b'):
    assert (hm is None) ^ (Pm is None)

    if typ == 'c':
        cstar = 1.1957  # Conical
    if typ == 'b':
        cstar = 1.2370  # Berkovich

    sigma_33 = sy * (1 + E / sy * 0.033) ** n
    Er = 1 / ((1 - nu ** 2) / E + (1 - nu_i ** 2) / E_i)
    C = sigma_33 * Pi1(Er / sigma_33)
    if hm is None:
        hm = (Pm / C) ** 0.5
    else:
        Pm = C * hm ** 2
    dPdh = Er * hm * Pi2(Er / sigma_33, n)
    Am = (1 / cstar / Er * dPdh) ** 2
    p_ave = Pm / Am
    if p_ave / Er > Pi4(0):
        hr = 0
    elif p_ave / Er < 0:
        hr = hm
    else:
        hr = optimize.brentq(lambda x: Pi4(x) - p_ave / Er, 0, 0.9952495) * hm
    WpWt = Pi5(hr / hm)
    return Er, C, hr, dPdh, WpWt, p_ave

def gen_forward():
    nu = 0.3
    hm = 0.2e-6
    nu_i = 0.0691
    E_i = 1143e9
    with open('../data/model.csv', 'w') as f:
        writer = csv.writer(f)
        writer.writerow(['n', 'Er (GPa)', 'sy (GPa)', 'C (GPa)', 'dP/dh (N/m)', 'Wp/Wt', 'hm (um)'])
        for _ in range(12000):
            E = random.uniform(10, 210)
            n = random.uniform(0, 0.5)
            sy = random.uniform(0.03, 3.0)
            hm = random.uniform(0.1e-6, 1.5e-6)
            if sy < 0.03 or sy > 3.0:
                continue

            Er = 1 / ((1 - nu ** 2) / E + (1 - nu_i ** 2) / E_i)
            if n > 0.3 and sy / Er >= 0.03:
                continue

            _, C, _, dPdh, WpWt, _ = forward_model(E * 1e9, n, sy * 1e9, nu, hm=hm)
            writer.writerow([n, Er, sy, C / 1e9, dPdh, WpWt, hm * 1e6])

def test_inverse(filename, nu=0.3):

    # Er
    # d = FileData(filename, 'Er')
    # C = np.array(d.column('C, GPa'))
    # WpWt = np.array(d.column('Wp/Wt'))
    # dPdh = np.array(d.column('dP/dh, N/m'))
    # hm = np.array(d.column('hm, um'))
    d = pd.read_csv('../data/' + filename + '.csv')
    C = np.array(d['C (GPa)'])
    WpWt = np.array(d['Wp/Wt'])
    dPdh = np.array(d['dP/dh (N/m)'])
    hm = np.array(d['hm (um)'])
    Er = np.array(d['Er (GPa)'])
    sy = np.array(d['sy (GPa)'])

    # Iterating over rows and applying model_inverse
    y_pred = np.array([
        model_inverse(C[i], dPdh[i], WpWt[i], hm[i], nu=nu, E_i=1143, typ='b')  # Accessing Er (first output) for each row[i], WpWt[i], hm[i], nu=nu, E_i=1143, typ='b')[0]  # Accessing E (first output)
        for i in range(len(Er))
    ])
    mape = np.mean(np.abs(y_pred[:, 0] - Er) / Er) * 100
    sd = np.std(np.abs(y_pred[:, 0] - Er) / Er) * 100
    print("Er MAPE:", mape, '±', sd)
    # sy
    mape = np.mean(np.abs(y_pred[:, 2] - sy) / sy) * 100
    sd = np.std(np.abs(y_pred[:, 2] - sy) / sy) * 100
    print('sy MAPE:', mape, '±', sd)

def find_closest(theta, Er, C, typ):
    if typ == 'r':
        def objective(x):
            return abs(Pitheta(theta, Er / x) - C / x)
    if typ == '33':
        def objective(x):
            return abs(Pi1(Er / x) - C / x)

    # Define the bounds for the search
    bounds = (1e4, 1e10)
    
    # Use minimize_scalar with method='bounded'
    result = optimize.minimize_scalar(objective, bounds=bounds, method='bounded')
    
    if result.success:
        return result.x
    else:
        raise ValueError("Optimization failed")

def model_inverse(C, dPdh, WpWt, hm, nu=0.3, theta=70.296, nu_i=0.0691, E_i=1143, typ='b'):
    C = C * 1e9
    E_i *= 1e9
    dPdh = dPdh
    WpWt = WpWt
    hm = hm * 1e-6
    if WpWt < Pi5(0):
        hr = 1e-9
    else:
        hr = optimize.brentq(lambda x: Pi5(x) - WpWt, 0, 1) * hm

    if typ == 'c':
        cstar = 1.1957  # Conical
    if typ == 'b':
        cstar = 1.2370  # Berkovich
    Pm = C * hm ** 2
    Am = (Pm * cstar / dPdh / Pi4(hr / hm)) ** 2
    Er = dPdh / cstar / Am ** 0.5
    for l, r in [[0, 1e2], [1e2, 1e4], [1e4, 1e6], [1e6, 1e8], [1e8, 1e10]]:
        if (Pi1(Er / l) - C / l) * (Pi1(Er / r) - C / r) < 0:
            # sigma_33 = optimize.brentq(lambda x: Pi1(Er / x) - C / x, 1e7, 1e10)
            sigma_33 = find_closest(theta, Er, C, '33')
            break
        if r == 1e10:
            # sigma_33 = (H/3) + 0.033 * Er
            E = (1 - nu ** 2) / (1 / Er - (1 - nu_i ** 2) / E_i)
            sy = (C * hm**2) / (3 * 24.5 * (hm - 0.75 * C * hm**2 / dPdh))
            print(sy)
            n = 0
            E/1e9, Er/1e9, sy/1e9, n
    for l, r in [[1e4, 1e7], [1e7, 1e9], [1e9, 5e9], [5e9, 1e10]]:
        if (Pitheta(theta, Er / l) - C / l) * (
            Pitheta(theta, Er / r) - C / r
        ) < 0:
            sigma_r = find_closest(theta, Er, C, 'r')
            # sigma_r = optimize.brentq(lambda x: Pitheta(theta, Er / x) - C / x, l, r)
            break
        else:
            # sigma_r = (H/3) + 0.033 * Er
            E = (1 - nu ** 2) / (1 / Er - (1 - nu_i ** 2) / E_i)
            sy = (C * hm**2) / (3 * 24.5 * (hm - 0.75 * C * hm**2 / dPdh))
            print(sy)
            n = 0
            return E/1e9, Er/1e9, sy/1e9, n
    epsilon = epsilon_r(theta)
    E = (1 - nu ** 2) / (1 / Er - (1 - nu_i ** 2) / E_i)
    # print(epsilon, ' ', sigma_33 - sigma_r)
    if (epsilon > 0.033 and sigma_33 < sigma_r) or (
        epsilon < 0.033 and sigma_33 > sigma_r
    ):
        sy = optimize.brentq(
            lambda x: np.log(sigma_33 / x) / np.log(sigma_r / x)
            - np.log(1 + E / x * 0.033) / np.log(1 + E / x * epsilon),
            1e7,
            min(sigma_33, sigma_r),
        )
        n = np.log(sigma_33 / sy) / np.log(1 + E / sy * 0.033)
    else:
        n = 0
        sy = (sigma_33 + sigma_r) / 2
    return E/1e9, Er/1e9, sy/1e9, n

def model(C, dPdh, WpWt, hm, nu=0.3, theta=70.296, nu_i=0.0691, E_i=1143, typ='b'):
    C *= 1e9
    E_i *= 1e9
    hm *= 1e-6

    if WpWt < Pi5(0):
        hr = 1e-9
    else:
        hr = optimize.brentq(lambda x: Pi5(x) - WpWt, 0, 1) * hm

    if typ == 'c':
        cstar = 1.1957  # Conical
    if typ == 'b':
        cstar = 1.2370  # Berkovich
    Pm = C * hm ** 2
    Am = (Pm * cstar / dPdh / Pi4(hr / hm)) ** 2
    Er = dPdh / cstar / Am ** 0.5
    for l, r in [[0, 1e2], [1e2, 1e4], [1e4, 1e6], [1e6, 1e8], [1e8, 1e10]]:
        if (Pi1(Er / l) - C / l) * (Pi1(Er / r) - C / r) < 0:
            # sigma_33 = optimize.brentq(lambda x: Pi1(Er / x) - C / x, 1e7, 1e10)
            sigma_33 = find_closest(theta, Er, C, '33')
            break
        if r == 1e10:
            # sigma_33 = (H/3) + 0.033 * Er
            E = (1 - nu ** 2) / (1 / Er - (1 - nu_i ** 2) / E_i)
            sy = (C * hm**2) / (3 * 24.5 * (hm - 0.75 * C * hm**2 / dPdh))
            print(sy)
            n = 0
            E/1e9, Er/1e9, sy/1e9, n
    for l, r in [[1e4, 1e7], [1e7, 1e9], [1e9, 5e9], [5e9, 1e10]]:
        if (Pitheta(theta, Er / l) - C / l) * (
            Pitheta(theta, Er / r) - C / r
        ) < 0:
            sigma_r = find_closest(theta, Er, C, 'r')
            # sigma_r = optimize.brentq(lambda x: Pitheta(theta, Er / x) - C / x, l, r)
            break
        else:
            # sigma_r = (H/3) + 0.033 * Er
            E = (1 - nu ** 2) / (1 / Er - (1 - nu_i ** 2) / E_i)
            sy = (C * hm**2) / (3 * 24.5 * (hm - 0.75 * C * hm**2 / dPdh))
            print(sy)
            n = 0
            return E/1e9, Er/1e9, sy/1e9, n
    epsilon = epsilon_r(theta)
    E = (1 - nu ** 2) / (1 / Er - (1 - nu_i ** 2) / E_i)
    # print(epsilon, ' ', sigma_33 - sigma_r)
    if (epsilon > 0.033 and sigma_33 < sigma_r) or (
        epsilon < 0.033 and sigma_33 > sigma_r
    ):
        sy = optimize.brentq(
            lambda x: np.log(sigma_33 / x) / np.log(sigma_r / x)
            - np.log(1 + E / x * 0.033) / np.log(1 + E / x * epsilon),
            1e7,
            min(sigma_33, sigma_r),
        )
        n = np.log(sigma_33 / sy) / np.log(1 + E / sy * 0.033)
    else:
        n = 0
        sy = (sigma_33 + sigma_r) / 2
    return E/1e9, Er/1e9, sy/1e9, n

def main():
    test_inverse('model')
    test_inverse('33TiAlTa')
    test_inverse('Al6061')
    # gen_forward()

if __name__ == '__main__':
    main()
