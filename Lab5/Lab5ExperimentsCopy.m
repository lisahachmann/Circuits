load nMOSIch.csv
load nMOSIg.csv
load nMOSVch.csv
load nMOSVg.csv
load pMOSIch.csv
load pMOSIg.csv
load pMOSVch.csv
load pMOSVg.csv
load exp1pMOSIchWI.csv
load exp1pMOSVgWI.csv
load exp1pMOSIchSI.csv
load exp1pMOSVgSI.csv
load exp1nMOSIchweak.csv
load exp1nMOSVgweak.csv
load exp1nMOSIchstrong.csv
load exp1nMOSVgstrong.csv

%% Experiment 1 Gate characteristics
% figure
% %ekvfit(pMOSVg(1:67), pMOSVg(1:67), 4e-5)
% %semilogy(pMOSVg(65:105), pMOSIch(65:105), 'b')
% hold on 
% semilogy((pMOSVg), abs(pMOSIch), 'ro')
% xlabel('Gate voltage (V)')
% ylabel('Channel current (Amps)')
% title('pMOS Gate Characteristics')

exp1pMOSIch = [exp1pMOSIchWI, exp1pMOSIchSI];
exp1pMOSVg = [exp1pMOSVgWI, exp1pMOSVgSI];
exp1nMOSIch = [exp1nMOSIchweak, exp1nMOSIchstrong];
exp1nMOSVg = [exp1nMOSVgweak, exp1nMOSVgstrong];
% %semilogy(pMOSVg(65:105), pMOSIch(65:105), 'b')

% Ut = .25;
% %nMOS fit
% nMOSIs=1.941*exp(-6)
% nMOSk = 0.6452;
% nMOSVt=0.6748;
% nMOSVs = 0;
% nMOSVd = 5;
% nMOSIF= nMOSIs.*(log(1+exp(nMOSk.*(exp1nMOSVg-nMOSVt)-nMOSVs)/2*Ut)).^2;
% nMOSIR= nMOSIs.*(log(1+exp(nMOSk.*(exp1nMOSVg-nMOSVt)-nMOSVd)/2*Ut)).^2;
% nMOSI=nMOSIF-nMOSIR;
% %pMOS Fit
% pMOSIs=2.544*exp(-7)
% pMOSk = 1.0384;
% pMOSVt=0.7335;
% pMOSVs = 0;
% pMOSVd = -5;
% pMOSIF= pMOSIs.*(log(1+exp(pMOSk.*(-exp1pMOSVg-pMOSVt)+pMOSVs)/2*Ut)).^2;
% pMOSIR= pMOSIs.*(log(1+exp(pMOSk.*(-exp1pMOSVg-pMOSVt)+pMOSVd)/2*Ut)).^2;
% pMOSI=pMOSIF-pMOSIR;
% 
% figure 
% semilogy((exp1nMOSVg), abs(exp1nMOSIch), 'bo')
% hold on
% semilogy((exp1nMOSVg), nMOSIF, 'b-')
% xlabel('Gate voltage (V)')
% ylabel('Channel current (Amps)')
% title('nMOS Gate Characteristics')
% figure
% semilogy((exp1pMOSVg), abs(exp1pMOSIch), 'ro')
% hold on
% semilogy((exp1pMOSVg), (pMOSIF), 'r-')
% xlabel('Gate voltage (V)')
% ylabel('Channel current (Amps)')
% title('pMOS Gate Characteristics')
% 
% figure
% semilogy((exp1nMOSVg), abs(exp1nMOSIch), 'bo')
% hold on
% semilogy((exp1nMOSVg), nMOSIF, 'b-')
% semilogy(abs(exp1pMOSVg), abs(exp1pMOSIch), 'ro')
% semilogy(abs(exp1pMOSVg), abs(pMOSIF), 'r-')
% xlabel('Gate voltage (V)')
% ylabel('Channel current (Amps)')
% title('Absolute Value Gate Characteristics')



%  %% Experiment 2 Source characteristics

load exp2nMOSIch.csv
load exp2nMOSVs.csv
load exp2pMOSIch.csv
load exp2pMOSVs.csv

figure
exp2nMOSx = abs(exp2nMOSVs(1:142));
exp2nMOSy = abs(exp2nMOSIch(1:142));
exp2nMOSWIx = [3.15, 3.216, 3.317, 3.392, 3.46];
exp2nMOSWIy = [.0000279, .0000117, .00000214, .000000259, .0000000126];
semilogy(exp2nMOSx, exp2nMOSy, 'o');
xlabel('Source voltage (V)');
ylabel('Channel current (Amps)');



exp2nMOSx2 =  3:0.1:4;
exp2nMOSy2 = (polyval(p,exp2nMOSx2));
hold on
semilogy(exp2nMOSx2,exp2nMOSy2, 'r')
title('nMOS')

x = exp2nMOSWIx ;  % independent variable quantities 
y = log(exp2nMOSWIy) ;  % dependent variable quantities 
pn = polyfit(exp2nMOSWIx, exp2nMOSWIy, 1)
exp2nMOSy2 = (polyval(pn,exp2nMOSx2));
hold on
semilogy(exp2nMOSx2, exp2nMOSy2, 'r')

figure
exp2pMOSx = (exp2pMOSVs);
exp2pMOSy = (exp2pMOSIch);
semilogy(exp2pMOSx, exp2pMOSy, 'o')
xlabel('Source voltage (V)')
ylabel('Channel current (Amps)')
title('pMOS')
exp2pMOSSIx = [-3.87; -3.819; -3.719; -3.693; -3.593];
exp2pMOSSIy = [.0000000016; .0000000226; .000000205; .000000965; .00000449];



exp2pMOSx2 =  -4:0.1:-3.4;
exp2pMOSy2 = (polyval(p,exp2pMOSx2));
hold on


x = exp2pMOSSIx ;  % independent variable quantities 
y = log(exp2pMOSSIy) ;  % dependent variable quantities 
p = polyfit(exp2pMOSSIx, exp2pMOSSIy, 1)
exp2pMOSy2 = (polyval(p,exp2pMOSx2));
semilogy(exp2pMOSx2, exp2pMOSy2, 'r')


%% Experiment 3
load exp3nMOSIch.csv
load exp3nMOSVd.csv
load exp3pMOSIch.csv
load exp3pMOSVd.csv
