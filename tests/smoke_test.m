% Smoke test for MetaSandwich-STL (Octave/MATLAB)
% Runs a few core helper functions to ensure the repo is callable.

fprintf('Running MetaSandwich-STL smoke test...\n');

addpath(genpath(pwd));

% Basic helper functions
m = 10;      % kg/m^2
D = 100;     % N*m
fcr = fcritical(m, D);
assert(isfinite(fcr) && fcr > 0);

E0 = 70e9; nu = 0.33; rho = 2700; R = 0.5;
fri = fring(E0, nu, rho, R);
assert(isfinite(fri) && fri > 0);

% STL transform
stl = fun_stl(0.5);
assert(isfinite(stl));

fprintf('OK. fcr=%.3f Hz, fri=%.3f Hz, STL(0.5)=%.3f dB\n', fcr, fri, stl);
