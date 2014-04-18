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
    disp('_________________________________');
    N1_res = N1 - filter(coeff_flt, 1, N2);
    X_est = X + N1_res;
    MSE_act = var(N1_res);
    
    disp(['M = ', num2str(M), ', MSE(theoretical) = ', num2str(MSE), 'MSE(actual)= ', num2str(MSE_act)]);
    
    figure;
    subplot(2, 1, 1), plot(0 : N - 1, sqrt(MSE) * ones(N, 1), 'r--', 'linewidth', 2), hold on;
    subplot(2, 1, 1), plot(0 : N - 1, N1_res, 'b', 'linewidth', 2), hold on; 
    subplot(2, 1, 1), plot(M, 0, 'k+', 'linewidth', 2);
    subplot(2, 1, 1), ylim([-2 * max(abs(N1_res(M : end))), 2 * max(abs(N1_res(M : end)))]), set(gca, 'fontsize', 18), grid on, xlabel('t'), legend('p^{1/2}', 'Residual of N_1');
    
    subplot(2, 1, 2), plot(0 : N - 1, X, 'r--', 'linewidth', 2), hold on;
    subplot(2, 1, 2), plot(0 : N - 1, X_est, 'b-', 'linewidth', 2), hold on;
    subplot(2, 1, 2), plot(M, 0, 'k+', 'linewidth', 2);
    subplot(2, 1, 2),  set(gca, 'fontsize', 18), grid on, xlabel('t'), legend('X', 'Estimated X');
end