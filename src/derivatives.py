import sympy as sym
from sympy import pprint
from sympy import N

# Define variables and equations
C, h, S, K1, K2 = sym.symbols('C, h, S, K1, K2')
# C in GPa, h in um, S in N/m
Er = K1 * S / (h*1e3 - K2 * C * (h*1e3)**2 / S)
sy = K1 * C * (h*1e3)**2 / ((h*1e3) - K2 * C * (h*1e-3)**2 / S)

# Partial derivative of Er
dEr_C = Er.diff(C)
dEr_S = Er.diff(S)
dEr_h = Er.diff(h)

# Partial derivative of sy
dsy_C = sy.diff(C)
dsy_S = sy.diff(S)
dsy_h = sy.diff(h)

# Print results in a more readable format
print('Partial derivatives of Er with respect to C:')
pprint(N(dEr_C, 10))
print('Partial derivatives of Er with respect to S:')
pprint(N(dEr_S, 10))
print('Partial derivatives of Er with respect to h:')
pprint(N(dEr_h, 10))
print('Partial derivatives of sy with respect to C:')
pprint(N(dsy_C, 10))
print('Partial derivatives of sy with respect to S:')
pprint(N(dsy_S, 10))
print('Partial derivatives of sy with respect to h:')
pprint(N(dsy_h, 10))