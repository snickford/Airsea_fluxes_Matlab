function sol = Solubility(SST,SSS)
% Adapted from the Python version by: https://github.com/breichl/airsea_fluxes/tree/main
% input: sea surface temperature in Kelvin, surface salinity
% returns: solubility (mmol L-1 atm-1) from SST and SSS
% equation from Weiss (1974) as published by Wanninkhof (2014)

a1 = -58.0931;
a2 = 90.5069;
a3 = 22.2940;
b1 = 0.027766;
b2 = -0.025888;
b3 = 0.0050578;

sol = exp(a1 + a2.*(100./SST) + a3.*log(SST./100) + ...
        SSS.*(b1 + b2.*SST./100 + b3.*(SST/100).^2))*1000;

end