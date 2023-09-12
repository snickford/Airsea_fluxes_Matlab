function kw_660_nb = DM18_KW660_nb(ust,sc)
% input: ust (u*; friction velocity, in units of m/s for output kw_660 
%               in units of m/s)
% returns: kw_660_nb - non-breaking gas transfer velocity in units of ust (usually m/s)


% anb = a non-dimensional coefficient between the transfer velocity and 
%       friction velocity
anb = 1.66e-4; 
kw_660_nb = anb.*ust; %.* sqrt(sc/660.);

end