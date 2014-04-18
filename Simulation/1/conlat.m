function [gamma, E, J] = conlat(Y, T)

if (size(Y, 2) ~= T + 1)
    error('Y must be a 1-by-(T + 1) vector!');
end

YMat = [2 * Y(T : -1 : 2)', Y(T + 1 : -1 : 3)' + Y(T - 1 : -1 : 1)'];
YMatSqr = YMat' * YMat;
gamma = - YMatSqr(1, 2) / YMatSqr(1, 1);

[E, ~] = latcfilt([gamma, 1], Y);
E = E(3 : T + 1);
J = norm(E) ^ 2 / (T - 1);