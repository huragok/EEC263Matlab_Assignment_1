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

for b = [0, 0.1, 0.2]
    Y2 = N2 + b * X;
    for M = [2, 4, 6];
        [r2, r12] = SampleCorr(N1, Y2, M);

        coeff_flt = filterWienerFIR(r12, r2);
        disp('_________________________________');
        N1_res = N1 - filter(coeff_flt, 1, Y2);
        X_est = X + N1_res;
        MSE_act = var(N1_res);

        disp(['b = ', num2str(b), ', M = ', num2str(M), ', MSE(actual)= ', num2str(MSE_act)]);
    end
end