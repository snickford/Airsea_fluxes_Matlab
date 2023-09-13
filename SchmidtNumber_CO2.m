function Sc = SchmidtNumber_CO2(SST)
% Adapted from the Python version by: https://github.com/breichl/airsea_fluxes/tree/main

% input: Sea surface temperature in Celcius
% returns: non-dimensional Schmidt number for CO2

% polynomial for Schmidt Number for CO2 valid over temp range -2 C to 40 C. 
% ref Wanninkhof (2014)

c1 = 2116.8;
c2 = -136.25;
c3 = 4.7353;
c4 = -0.092307;
c5 = 0.000755;

Sc = c1 + c2.*SST + c3.*SST.^2 + c4.*SST.^3 + c5.*SST.^4;
end



