import sympy as sym
from sympy import pprint
from sympy import N

# # Define variables and equations
# C, h, S, K1, K2, K3 = sym.symbols('C, h, S, K1, K2, K3')
# # C in GPa, h in um, S in N/m. Er and sy in GPa.
# Er = K1 * S / (K2 * h*1e3 - K3 * C * (K2 * h*1e3)**2 / S)
# sy = K1 * C * (K2 * h*1e3)**2 / ((h*1e3) - K3 * C * (K2 * h*1e3)**2 / S)

# # Partial derivative of Er
# dEr_C = Er.diff(C)
# dEr_S = Er.diff(S)
# dEr_h = Er.diff(h)

# # Partial derivative of sy
# dsy_C = sy.diff(C)
# dsy_S = sy.diff(S)
# dsy_h = sy.diff(h)

# # Print results in a more readable format
# print('Partial derivatives of Er with respect to C:')
# pprint(N(dEr_C, 10))
# print('Partial derivatives of Er with respect to S:')
# pprint(N(dEr_S, 10))
# print('Partial derivatives of Er with respect to h:')
# pprint(N(dEr_h, 10))
# print('Partial derivatives of sy with respect to C:')
# pprint(N(dsy_C, 10))
# print('Partial derivatives of sy with respect to S:')
# pprint(N(dsy_S, 10))
# print('Partial derivatives of sy with respect to h:')
# pprint(N(dsy_h, 10))

# mu16, theta, kappa, KI, KII, sqrtpi = sym.symbols('mu16, theta, kappa, KI, KII, sqrtpi')
# S = (1/(mu16))*((1+sym.cos(theta))*(kappa-sym.cos(theta))*(KI/sqrtpi)**2+2*sym.sin(theta)*(2*sym.cos(theta)-(kappa-1))*(KI/sqrtpi)*(KII/sqrtpi)+((kappa+1)*(1-sym.cos(theta))+(1+sym.cos(theta))*(3*sym.cos(theta)-1))*(KII/sqrtpi)**2)
# dS = S.diff(theta)
# ddS = dS.diff(theta)
# print('dS:')
# pprint(N(dS, 10))
# print('ddS:')
# pprint(N(ddS, 10))




# # This is the second set of equations.
# C, S, W, h = sym.symbols('C, S, W, h')

# A = h**2 * sym.exp(1.218 * W + 2.198)
# Er = S / (1.167 * sym.sqrt(A))
# E = (1-0.3**2) / (1 / Er - (1-0.0691**2) / 1143)
# # a29 = 0.29 *Er * (-0.696 * W**2 -0.344 * W + 1) # \sigma_{0.29}+b29\sigma_y=a29
# # b29 = 11 * 0.29 - 1 # \sigma_{0.29}=a29-b29\sigma_y 
# # # s29 = (a29-b29*sy)
# # Ceq = sym.Eq(C, 6.5*(a29-b29*sy)*(1+sy/(a29-b29*sy))*(-1+sym.ln(Er/sy)))

# # # C = 6.5*(a29-b29*sy)*(1+sy/(a29-b29*sy))*(-1+sym.ln(Er/sy))
# # sy = sym.solve(Ceq, sy)
# H = C * h**2 / A
# alpha = 70.296 * sym.pi / 180
# sy = 3 * H / 2 - sym.ln(sym.cot(alpha)*E*H/9)

# pprint(N(Er, 10))
# pprint(N(sy, 10))

# pprint(Er.diff(C))
# pprint(Er.diff(S))
# pprint(Er.diff(W))
# pprint(Er.diff(h))

# pprint(sy.diff(C))
# pprint(sy.diff(S))
# pprint(sy.diff(W))
# pprint(sy.diff(h))





# # First set of equations with different scaling factor for Er
C, h, W, S, HC, K1, K2, K3 = sym.symbols('C, h, W, S, HC, K1, K2, K3')
# C in GPa, h in um, S in N/m. Er and sy in GPa.
Er = K1 * S / (K2 * W * h*1e3 - K3 * C * (K2 * W *h*1e3)**2 / S)
E = (1-0.3**2) / (1 / Er - (1-0.0691**2) / 1143)
H = K1 * W * C*1e9 / 24.5
alpha = 70.296 * sym.pi / 180
sy = 1.5 * K2*H - sym.ln(sym.cot(alpha)*K3*E*H/9)

# Partial derivative of Er
dEr_C = Er.diff(C)
dEr_S = Er.diff(S)
dEr_W = Er.diff(W)
dEr_h = Er.diff(h)

# Partial derivative of sy
dsy_C = sy.diff(C)
dsy_S = sy.diff(S)
dsy_W = sy.diff(W)
dsy_h = sy.diff(h)

# Print results in a more readable format
print('Partial derivatives of Er with respect to C:')
pprint(N(dEr_C, 10))
print('Partial derivatives of Er with respect to S:')
pprint(N(dEr_S, 10))
print('Partial derivatives of Er with respect to W:')
pprint(N(dEr_W, 10))
print('Partial derivatives of Er with respect to h:')
pprint(N(dEr_h, 10))
print('Partial derivatives of sy with respect to C:')
pprint(N(dsy_C, 10))
print('Partial derivatives of sy with respect to S:')
pprint(N(dsy_S, 10))
print('Partial derivatives of sy with respect to W:')
pprint(N(dsy_W, 10))
print('Partial derivatives of sy with respect to h:')
pprint(N(dsy_h, 10))

print('Partial derivatives of Er with respect to C:')
print(N(dEr_C, 3))
print('Partial derivatives of Er with respect to S:')
print(N(dEr_S, 3))
print('Partial derivatives of Er with respect to W:')
print(N(dEr_W, 3))
print('Partial derivatives of Er with respect to h:')
print(N(dEr_h, 3))
print('Partial derivatives of sy with respect to C:')
print(N(dsy_C, 3))
print('Partial derivatives of sy with respect to S:')
print(N(dsy_S, 3))
print('Partial derivatives of sy with respect to W:')
print(N(dsy_W, 3))
print('Partial derivatives of sy with respect to h:')
print(N(dsy_h, 3))