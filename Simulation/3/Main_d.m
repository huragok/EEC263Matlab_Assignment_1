clear all;
close all;
clc;

A = 1;
omega = 0.05 * pi;
theta = 0;
a1 = -0.5;
a2 = 0.8;
q = 1;
N = 200;
N_history_gen = 200;

[X, N1, N2, Y1] = GenSignal(A, omega, theta, a1, a2, q, N, N_history_gen);

for M = [2, 4, 6];
    r12 = q / (1 - a1 * a2) * a1 .^ (0 : M - 1);
    r2 = q / (1 - a2 ^ 2) * a2 .^ (0 : M - 1);
    coeff_flt = filterWienerFIR(r12, r2);
    MSE = q / (1 - a1 ^ 2) - r12 * coeff_flt;
    N1_res = N1 - filter(coeff_flt, 1, N2);
    MSE_exact_corr = var(N1_res);
    
    [r2, r12] = SampleCorr(N1, N2, M);
    coeff_flt = filterWienerFIR(r12, r2);
    N1_res = N1 - filter(coeff_flt, 1, N2);
    MSE_est_corr = var(N1_res);
    
    disp('_________________________________');
    disp(['M = ', num2str(M)]);
    disp(['MSE(theoretical) = ', num2str(MSE)]);
    disp(['MSE(actual, exact correlation) = ', num2str(MSE_exact_corr)]);
    disp(['MSE(actual, esimated correlation) = ', num2str(MSE_est_corr)]);
end