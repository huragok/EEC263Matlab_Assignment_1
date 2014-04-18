function [X, N1, N2, Y1] = GenSignal(A, omega, theta, a1, a2, q, N, N_history)

V = sqrt(q) * randn(1, N + N_history);
N1_temp = filter(1, [1, -a1], V);
N2_temp = filter(1, [1, -a2], V);

N1 = N1_temp(N_history + 1 : N + N_history);
N2 = N2_temp(N_history + 1 : N + N_history);
X = A * cos(omega * (0 : N - 1) + theta);
Y1 = X + N1;
