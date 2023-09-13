function kw14_660 = KW14_660(u10)
% Adapted from the Python version by: https://github.com/breichl/airsea_fluxes/tree/main

% input: wind speed measured at 10m height above the ocean assuming a neutrally
%        stable atmosphere(units of m/s)
% returns: gas transfer velocity (units of cm/hr)

c = 0.251; % coefficient determined by Wanninkhof in units of (cm/hr)/(m/s)^2 

kw14_660 = c .* u10.^2;

end