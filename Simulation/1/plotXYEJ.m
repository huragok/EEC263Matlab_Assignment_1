function h = plotXYEJ(X, Y, E, J)

T = size(X, 2) - 1;
if (T + 1 ~= size(Y, 2) || T - 1 ~= size(E, 2))
    error('Size of X, Y, E do not match!');
end

h = figure;
subplot(2, 1, 1), plot(0 : T, X, 'b--', 'linewidth', 2), hold on;
subplot(2, 1, 1), plot(0 : T, Y, 'ro-', 'linewidth', 2), hold on;
subplot(2, 1, 1), grid on, set(gca, 'fontsize', 18), legend('X', 'Y'), grid on, xlabel('t');

subplot(2, 1, 2), plot(2 : T, J ^ (1 / 2) * ones(1, T - 1), 'b--', 'linewidth', 2), hold on;
subplot(2, 1, 2), plot(2 : T, E, 'ro-', 'linewidth', 2), hold on; 
subplot(2, 1, 2), grid on, set(gca, 'fontsize', 18), legend('J^{1/2}', 'E'), grid on, xlabel('t');