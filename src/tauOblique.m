function tau = tauOblique(z, theta)
%%% Transmission coefficient of a panel at oblique incidence.
%%% z: impedance function handle, z(theta) -> Z(f,theta)
%%% theta: incidence angle [rad]

    % Avoid legacy script-side effects; use struct-based parameters.
    ac = load_acoustic_parameters();
    zc = ac.zc;

    tau = abs(1 + z(theta) * cos(theta) / (2 * zc)).^(-2);

end
