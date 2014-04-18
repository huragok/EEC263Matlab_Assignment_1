clear all;
close all;
clc;

r = 1;
a = 0.8;
N = 10;

[coeff_flt, MSE] = filterWienerFIR(a, r, N);
disp('Optimum filter = ');
disp(coeff_flt);
disp(['MSE = ', num2str(MSE)]);
Ky = toeplitz(a .^ (0 : (N - 1)), a .^ (0 : (N - 1))) + r * eye(N);
Kyx = (a .^ (0 : (N - 1)))';
coeff_flt_ref = Ky \ Kyx;
MSE_ref = 1 - a .^ (0 : (N - 1)) * coeff_flt_ref;