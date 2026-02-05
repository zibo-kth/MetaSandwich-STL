function air = air_properties(f)
%AIR_PROPERTIES Return standard air properties and derived quantities.
%
% air = air_properties(f)
%   f: frequency vector [Hz] (optional). If omitted, defaults to 20..10000 Hz.
%
% Returns struct with fields:
%   rho0, c0, zc, f, omega, k

if nargin < 1 || isempty(f)
    f = (20:1:10000)';
end

air.rho0 = 1.2;      % [kg/m^3]
air.c0   = 343;      % [m/s]
air.zc   = air.rho0 * air.c0;

air.f = f(:);
air.omega = 2*pi*air.f;
air.k = air.omega ./ air.c0;
end
