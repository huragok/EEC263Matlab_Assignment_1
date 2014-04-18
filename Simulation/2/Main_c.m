clear all;
close all;
clc;

r = 1;
N = 10;
a = 0.1 : 0.1 : 0.9;
MSE = zeros(length(a), 1);

for ind = 1 : length(a)
    [~, MSE(ind)] = filterWienerFIR(a(ind), r, N);
end

figure;
plot(a, MSE, 'bo-', 'linewidth', 2);
grid on;
set(gca, 'fontsize', 18), xlabel('a'), ylabel('MSE');