function kw_660_b =  DM18_KW660_b(ust, hs, alpha, sc)
% input: ust: Friction velocity, m s^{-1}
%        hs: Significant wave height, m
%        alpha: Non-dimensional diffusivity
%        Sc: Non-dimensional Schmidt number
% 
% return: kw_660_b - computes the bubble-mediated component of kw_660 due
%         to breaking waves

abt = 1.1e-5; % Coefficient 1.1e-5, # s^2 m^{-2}
gamma = 5/3; % scaling parameter (see DM18)
zeta = 4/3; % scaling parameter (see DM18)
grav = 9.81;
ab = abt;%.* sqrt(sc/660);

kw_660_b = ab .* ust.^gamma .* sqrt(grav.*hs).^zeta ./ alpha;

end