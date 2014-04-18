function [r2, r12] = SampleCorr(N1, N2, M)

N = length(N1);
if (length(N2) ~= N)
    error('N1 and N2 must be of the same length!');
end

r2 = zeros(1, M);
r12 = zeros(1, M);

for m = 0 : M - 1
    r2(m + 1) = N2(1 + m : N) * N2(1 : N - m)' / (N - m);
    r12(m + 1) = N1(1 + m : N) * N2(1 : N - m)' / (N - m);
end