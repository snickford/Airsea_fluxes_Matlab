% Demonstration of Air Sea Fluxes Matlab package

%% First demonstrate Wanninkhof 2014 parameterization


U10 = linspace(1,25,50);
kw_14 = KW14_660(U10);

figure;plot(U10,kw_14,'linewidth',2);hold on;grid
xlabel('U_{10N} [m/s]')
ylabel('k_{w660} [cm/hr]')
set(gca,'fontsize',14)

%% Next, demonstrate DM18 parameterization
% For this demonstration, we assume the following data are available:
% u_10N (10-m neutral wind speed), hs (significant wave height), SST (sea
% surface temperature in degrees C), SSS (sea surface salinity).

% u_10N gets converted to u* (ustar: air-side friction velocity) using a
% drag coefficient (cd) of 0.002 (this can be updated using the COARE flux drag 
% coefficient, for example).
cd = 0.002;
ustar = sqrt(cd).*U10;

% for this example, it is assumed that significant wave height (hs) varies 
% linearly with wind speed. For real application, hs should be provided 
% externally via observations or model.
hs = linspace(1,5,50);

% we assume values for SST and salinity for the example but this should be
% provided using real data.
sst = 15*ones(1,length(hs));
sss = 35*ones(1,length(hs));

% next we calculate the Schmidt number from SST, solubility, and alpha
Sc = SchmidtNumber_CO2(sst);
k0 = Solubility(sst+273.15,sss);
alpha = Alpha_Solubility(k0,sst+273.15);

mps2cph = 3600*100; % conversion from [m/s] to [cm/hr]

% finally we calculate the bubble and non-bubble component of DM18
kw_660_nb = DM18_KW660_nb(ustar);
kw_660_b =  DM18_KW660_b(ustar, hs, alpha, Sc);

kw_660_DM18 = kw_660_nb + kw_660_b;

figure;plot(U10,kw_14,'r','linewidth',2);hold on;grid
plot(U10,kw_660_DM18.*mps2cph,'k','linewidth',2)
xlabel('U_{10N} [m/s]')
ylabel('k_{w660} [cm/hr]')
set(gca,'fontsize',14)
legend('W14','DM18')

%% DM18 parameterization changes for different wind and hs

U10 = linspace(1,25,50);
cd = 0.002;
ustar = sqrt(cd).*U10;
sst = 15*ones(1,length(U10));
sss = 35*ones(1,length(U10));

Sc = SchmidtNumber_CO2(sst);
k0 = Solubility(sst+273.15,sss);% SST in Kelvin
alpha = Alpha_Solubility(k0,sst+273.15); % SST in Kelvin
mps2cph = 3600*100; % conversion from m/s to cm/hr
kw_660_nb = DM18_KW660_nb(ustar);

hs = [0 2 4 6 8 10];
for ii = 1:length(hs)

    kw_660_b(ii,:) =  DM18_KW660_b(ustar, hs(ii), alpha, Sc);
    kw_660_DM18(ii,:) = kw_660_nb + kw_660_b(ii,:);

end

figure;plot(U10,kw_660_DM18(1,:).*mps2cph,'k','linewidth',2);hold on;grid
plot(U10,kw_660_DM18(2,:).*mps2cph,'b','linewidth',2)
plot(U10,kw_660_DM18(3,:).*mps2cph,'g','linewidth',2)
plot(U10,kw_660_DM18(4,:).*mps2cph,'c','linewidth',2)
plot(U10,kw_660_DM18(5,:).*mps2cph,'m','linewidth',2)
plot(U10,kw_660_DM18(6,:).*mps2cph,'y','linewidth',2)
xlabel('U_{10N} [m/s]')
ylabel('k_{w660} [cm/hr]')
set(gca,'fontsize',14)
legend('DM18 hs=0','DM18 hs=2','DM18 hs=4','DM18 hs=6','DM18 hs=8','DM18 hs=10')
