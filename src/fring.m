function fri = fring(E0, nu, rho, R)
%FRING Ring frequency of a panel.
%
% This helper should not rely on injected variables from scripts.

fri = sqrt(E0./rho./(1-nu.^2)) ./ (2*pi*R);
end
