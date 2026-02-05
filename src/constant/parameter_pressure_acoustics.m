% Deprecated legacy script (kept for backward compatibility).
%
% Older code used this file as a script to inject variables into the caller
% workspace (rho0, c0, zc, f, omega, k). This is fragile.
%
% New code should use:
%   air = air_properties(f);
% and then access air.rho0, air.c0, air.zc, ...

air = air_properties((20:1:10000)');

rho0 = air.rho0;
c0   = air.c0;
zc   = air.zc;

f     = air.f;
omega = air.omega;
k     = air.k;
