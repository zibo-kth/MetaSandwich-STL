function fcr = fcritical(m, D)
%FCRITICAL Critical frequency of a panel.
%
% Legacy note: older versions relied on the script
% `src/constant/parameter_pressure_acoustics.m` which injected variables into
% the caller workspace. That pattern is fragile and breaks composability.
%
% Air sound speed (can be parameterized by the caller if needed)
c0 = 343; % [m/s]

fcr = c0^2/(2*pi) * sqrt(m./D);
end
