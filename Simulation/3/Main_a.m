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

figure;
plot(0 : N - 1, X, 'r--', 'linewidth', 2), hold on;
plot(0 : N - 1, Y1, 'b-', 'linewidth', 2), hold on;
set(gca, 'fontsize', 18), grid on, xlabel('t'), legend('X(t)', 'Y(t)');