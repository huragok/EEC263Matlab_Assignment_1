clear all;
close all;
clc;

%% 1. Simulation settings
A = 10;
f0 = 0.25;
phi = 0;
r = 1;
T = 20;

%% 2. Simulation
[X, Y] = noisin(A, f0, phi, r, T);
[gamma, E, J] = conlat(Y, T);
gammaRef = - A ^ 2 / (2 * r) * cos(2 * pi * f0) / (1 + A ^ 2 / (2 * r)); % optimal gamma with a priori

%% 3. Postprocessing and visualization
plotXYEJ(X, Y, E, J);
f0Est = acos(-gamma) / (2 * pi);
f0EstRef = acos(-gammaRef * (1 + A ^ 2 / (2 * r)) / (A ^ 2 / (2 * r))) / (2 * pi);

disp(['gamma = ', num2str(gamma)]);
disp(['J = ', num2str(J)]);
disp(['Estimated f0 = ', num2str(f0Est)]);
disp('____________________________________');
disp(['gamma (with a priori) = ', num2str(gammaRef)]);
disp(['Estimated f0 (with a priori) = ', num2str(f0EstRef)]);

