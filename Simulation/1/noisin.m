function [X, Y] = noisin(A, f0, phi, r, T)

X = A * cos(2 * pi * f0 * (0 : T) + phi);
Y = X + sqrt(r) * randn(1, T + 1);

end

