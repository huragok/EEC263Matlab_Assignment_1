function [coeff_flt, MSE] = filterWienerFIR(a, r, N)

coeff_prd = zeros(N, 1);
coeff_flt = zeros(N, 1);

M = 1 + r; % MSE(0)
coeff_flt(1) = 1 / (1 + r);

for n = 0 : (N - 2)
    delta = (a .^ ((n + 1) : -1 : 1)) * [1; coeff_prd(1 : n)]; 
    gamma = - delta / M;
    coeff_prd(1 : n) = coeff_prd(1 : n) + gamma * coeff_prd(n : -1 : 1);
    coeff_prd(n + 1) = gamma;
    M = M * (1 - gamma ^ 2);
    
    if (M == 0)
        break;
    end
    
    mu = 0 + a .^ ((n + 1) : -1 : 1) * coeff_flt(1 : (n + 1)); 
    omega = (a ^ (n + 1) - mu) / M;
    coeff_flt(1 : (n + 1)) = coeff_flt(1 : (n + 1)) + omega * coeff_prd((n + 1) : -1 : 1);
    coeff_flt(n + 2) = omega;
end

MSE = 1 - a .^ (0 : (N - 1)) * coeff_flt;