%% Experiment 1

load exp1nMOSQ1I.csv
load exp1nMOSQ1Vg.csv
load exp1nMOSQ2I.csv
load exp1nMOSQ2Vg.csv
load exp1nMOSQ3I.csv
load exp1nMOSQ3Vg.csv
load exp1nMOSQ4I.csv
load exp1nMOSQ4Vg.csv

load kappa1.csv
load kappa2.csv
load kappa3.csv
load kappa4.csv
load Is1.csv
load Is2.csv
load Is3.csv
load Is4.csv
load VT1.csv
load VT2.csv
load VT3.csv
load VT4.csv

%raw data
% Q1Iweak = exp1nMOSQ1I(1:150);
% Q1Vgweak = exp1nMOSQ1Vg(1:150);
% Q1Istrong = exp1nMOSQ1I(151:4:500);
% Q1Vgstrong = exp1nMOSQ1Vg(151:4:500);
% Q2Iweak = exp1nMOSQ2I(1:150);
% Q2Vgweak = exp1nMOSQ2Vg(1:150);
% Q2Istrong = exp1nMOSQ2I(151:4:500);
% Q2Vgstrong = exp1nMOSQ2Vg(151:4:500);
% Q3Iweak = exp1nMOSQ3I(1:150);
% Q3Vgweak = exp1nMOSQ3Vg(1:150);
% Q3Istrong = exp1nMOSQ3I(151:4:500);
% Q3Vgstrong = exp1nMOSQ3Vg(151:4:500);
% Q4Iweak = exp1nMOSQ4I(1:150);
% Q4Vgweak = exp1nMOSQ4Vg(1:150);
% Q4Istrong = exp1nMOSQ4I(151:4:500);
% Q4Vgstrong = exp1nMOSQ4Vg(151:4:500);
% 
% Q1I = [Q1Iweak, Q1Istrong];
% Q1Vg = [Q1Vgweak, Q1Vgstrong];
% Q2I = [Q2Iweak, Q2Istrong];
% Q2Vg = [Q2Vgweak, Q2Vgstrong];
% Q3I = [Q3Iweak, Q3Istrong];
% Q3Vg = [Q3Vgweak, Q3Vgstrong];
% Q4I = [Q4Iweak, Q4Istrong];
% Q4Vg = [Q4Vgweak, Q4Vgstrong];
% 
% semilogy(Q1Vgweak, Q1Iweak, 'ro')
% hold on
% semilogy(Q1Vgstrong, Q1Istrong, 'r*')
% hold on
% semilogy(Q2Vgweak, Q2Iweak, 'ko')
% hold on
% semilogy(Q2Vgstrong, Q2Istrong, 'k*')
% hold on
% semilogy(Q3Vgweak, Q3Iweak, 'bo')
% hold on
% semilogy(Q3Vgstrong, Q3Istrong, 'b*')
% hold on
% semilogy(Q4Vgweak, Q4Iweak, 'mo')
% hold on
% semilogy(Q4Vgstrong, Q4Istrong, 'm*')

%how to run the EKV
%for transistor1, in command line say: 
%[Is1, VT1, kappa1] = ekvfit(Q1Vg, -Q1I, 4e-4, 'on')

%%Making the plot with EKV values
Ut = 0.025;
Vs = 0;
Vd = 5;
Fit_IQ1= Q1I.*(log(1+exp(kappa1.*(Q1Vg-VT1)-Vs)/2*Ut)).^2;
Fit_IQ2= Q2I.*(log(1+exp(kappa2.*(Q2Vg-VT2)-Vs)/2*Ut)).^2;
Fit_IQ3= Q3I.*(log(1+exp(kappa3.*(Q3Vg-VT3)-Vs)/2*Ut)).^2;
Fit_IQ4= Q4I.*(log(1+exp(kappa4.*(Q4Vg-VT4)-Vs)/2*Ut)).^2;

semilogy(Q1Vg, Fit_IQ1, 'k')
hold on
semilogy(Q1Vg, Q1I, 'ko')
hold on
semilogy(Q2Vg, Fit_IQ2, 'm')
hold on
semilogy(Q2Vg, Q2I, 'm*')
hold on
semilogy(Q3Vg, Fit_IQ3, 'r')
hold on
semilogy(Q3Vg, Q3I, 'r>')
hold on
semilogy(Q4Vg, Fit_IQ4, 'b')
hold on
semilogy(Q4Vg, Q4I, 'b.')

xlabel('Gate voltage (V)')
ylabel('Channel current (A)')
legend('Q1 Theoretical', 'Q1 Data', 'Q2 Theoretical', 'Q2 Data', 'Q3 Theoretical', 'Q3 Data', 'Q4 Theoretical', 'Q4 Data')
title('Channel current for different transistors with /2Ut in forward current theoretical')

%% percentage difference
% Also, make a semilog (i.e., make the x-axis log) plot showing the percentage

% meanI = (Q1I + Q2I + Q3I + Q4I)/4;
% 
% Q1diff = ((Q1I-meanI)/((Q1I + meanI)/2))*100;
% Q2diff = ((Q2I-meanI)/((Q2I + meanI)/2))*100;
% Q3diff = ((Q3I-meanI)/((Q3I + meanI)/2))*100;
% Q4diff = ((Q4I-meanI)/((Q4I + meanI)/2))*100;