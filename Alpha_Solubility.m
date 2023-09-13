function alpha = Alpha_Solubility(K0, SST)
% Adapted from the Python version by: https://github.com/breichl/airsea_fluxes/tree/main

% input: solubility [mmol L^-1 atm^-1], sea surface temperature in kelvin
% returns: non-dimensional solubility (to be used in DM18 calculation)

Atm2Pa = 101325;
R = 8.314; % m3⋅Pa⋅K^−1⋅mol^−1
alpha = K0.*R.*SST./Atm2Pa;

end

