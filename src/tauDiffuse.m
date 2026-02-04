function tau_diffuse = tauDiffuse(z, dtheta, theta1, theta2)

%%%% this function return the diffuse transmission coefficient of a panel
%%%% from angle theta1 to angle theta2

% Get the size of the impedance function output to determine frequency array size
% Test with a sample angle to get the array dimensions
test_tau = tauOblique(z, theta1);
tau_diffuse = zeros(size(test_tau));

weightSum = 0;
for theta = theta1:dtheta:theta2
    Ve_tau = tauOblique(z, theta);
    w = sin(2*theta);
    tau_diffuse = tau_diffuse + Ve_tau .* w .* dtheta;
    weightSum = weightSum + w .* dtheta;
end

% Normalize by weight integral so result is insensitive to dtheta.
if weightSum ~= 0
    tau_diffuse = tau_diffuse ./ weightSum;
end

end
