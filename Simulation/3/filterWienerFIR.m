function coeff_flt = filterWienerFIR(r12, r2)

M = size(r12, 2);
if (size(r2, 2) ~= M)
    error('Both r12 and r2 must be 1-by-M');
end

coeff_prd = zeros(M, 1);
coeff_flt = zeros(M, 1);

MSE_prd = r2(1);
coeff_flt(1) = r12(1) / r2(1);

for m = 0 : (M - 2)   
    delta = r2((m + 2) : -1 : 2) * [1; coeff_prd(1 : m)];
    gamma = - delta / MSE_prd; 
    coeff_prd(1 : m) = coeff_prd(1 : m) + gamma * coeff_prd(m : -1 : 1);
    coeff_prd(m + 1) = gamma;
    MSE_prd = MSE_prd * (1 - gamma ^ 2);
    
    if (MSE_prd == 0)
        break;
    end
    
    mu = 0 + r2((m + 2) : -1 : 2) * coeff_flt(1 : (m + 1), 1);
    omega = (r12(m + 2) - mu) / MSE_prd;  
    coeff_flt(1 : (m + 1)) = coeff_flt(1 : (m + 1)) + omega * coeff_prd((m + 1) : -1 : 1);
    coeff_flt(m + 2) = omega;
end