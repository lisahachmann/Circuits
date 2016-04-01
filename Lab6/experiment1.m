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

load exp1nMOSQ1I2.csv
load exp1nMOSQ1Vg2.csv

%raw data
Q1Iweak = exp1nMOSQ1I(1:150);
Q1Vgweak = exp1nMOSQ1Vg(1:150);
Q1Istrong = exp1nMOSQ1I(151:4:500);
Q1Vgstrong = exp1nMOSQ1Vg(151:4:500);




Q2Iweak = exp1nMOSQ2I(1:150);
Q2Vgweak = exp1nMOSQ2Vg(1:150);
Q2Istrong = exp1nMOSQ2I(151:4:500);
Q2Vgstrong = exp1nMOSQ2Vg(151:4:500);
Q3Iweak = exp1nMOSQ3I(1:150);
Q3Vgweak = exp1nMOSQ3Vg(1:150);
Q3Istrong = exp1nMOSQ3I(151:4:500);
Q3Vgstrong = exp1nMOSQ3Vg(151:4:500);
Q4Iweak = exp1nMOSQ4I(1:150);
Q4Vgweak = exp1nMOSQ4Vg(1:150);
Q4Istrong = exp1nMOSQ4I(151:4:500);
Q4Vgstrong = exp1nMOSQ4Vg(151:4:500);



 

Q1I = [Q1Iweak, Q1Istrong];
Q1Vg = [Q1Vgweak, Q1Vgstrong];
Q2I = [Q2Iweak, Q2Istrong];
Q2Vg = [Q2Vgweak, Q2Vgstrong];
Q3I = [Q3Iweak, Q3Istrong];
Q3Vg = [Q3Vgweak, Q3Vgstrong];
Q4I = [Q4Iweak, Q4Istrong];
Q4Vg = [Q4Vgweak, Q4Vgstrong];



% figure

% semilogy(Q1Vgweak, Q1Iweak, 'ro')
% hold on
% semilogy(Q1Vgstrong, Q1Istrong, 'r*')
% semilogy(Q2Vgweak, Q2Iweak, 'ko')
% semilogy(Q2Vgstrong, Q2Istrong, 'k*')
% semilogy(Q3Vgweak, Q3Iweak, 'bo')
% semilogy(Q3Vgstrong, Q3Istrong, 'b*')
% semilogy(Q4Vgweak, Q4Iweak, 'mo')
% semilogy(Q4Vgstrong, Q4Istrong, 'm*')

% how to run the EKV
% for transistor1, in command line say: 
% [Is1, VT1, kappa1] = ekvfit(Q1Vg, -Q1I, 4e-4, 'on')

%Making the plot with EKV values
Ut = 0.025;
Vs = 0;
Vd = 5;


%Fit_IQ1= Q1I.*(log(1+exp(kappa1.*(Q1Vg-VT1)-Vs)/(2*Ut))).^2;
%Fit_IQ2= Q2I.*(log(1+exp(kappa2.*(Q2Vg-VT2)-Vs)/(2*Ut))).^2;
%Fit_IQ3= Q3I.*(log(1+exp(kappa3.*(Q3Vg-VT3)-Vs)/(2*Ut))).^2;
%Fit_IQ4= Q4I.*(log(1+exp(kappa4.*(Q4Vg-VT4)-Vs)/(2*Ut))).^2;

P1 = polyfit((Q1Vg),(log(abs(Q1I))),1)
Fit_IQ1 = P1(1)*(Q1Vg)+P1(2);

P2 = polyfit((Q2Vg),(log(abs(Q2I))),1)
Fit_IQ2 = P2(1)*(Q2Vg)+P2(2);


P3 = polyfit((Q3Vg),(log(abs(Q3I))),1)
Fit_IQ3 = P3(1)*(Q3Vg)+P3(2);

P4 = polyfit((Q4Vg),(log(abs(Q4I))),1)
Fit_IQ4 = P4(1)*(Q4Vg)+P4(2);




figure


semilogy(Q1Vg, (Fit_IQ1), 'k')

hold on

semilogy(Q1Vg, abs(Q1I), 'ko')
plot(Q2Vg, (Fit_IQ2), 'm')

semilogy(Q2Vg, abs(Q2I), 'm*')

plot(Q3Vg, (Fit_IQ3), 'r')

semilogy(Q3Vg, abs(Q3I), 'r>')

plot(Q4Vg, (Fit_IQ4), 'b')

semilogy(Q4Vg, abs(Q4I), 'b.')

xlabel('Gate voltage (V)')
ylabel('Channel current (A)')
legend('Q1 Theoretical', 'Q1 Data', 'Q2 Theoretical', 'Q2 Data', 'Q3 Theoretical', 'Q3 Data', 'Q4 Theoretical', 'Q4 Data')
title('Channel current for different transistors with /2Ut in forward current theoretical')





%% percentage difference
% Also, make a semilog (i.e., make the x-axis log) plot showing the percentage
% meani = ones([1, length(Q1I)]);
% for i = 1:length(Q1I)
%     meani(i) = (Q1I(i) + Q2I(i) + Q3I(i) + Q4I(i))./4;
% end

meanI = (Q2I + Q3I + Q4I)./3;

Q1diff = ((Q1I-meanI)./((Q1I + meanI)./2)).*100;
Q2diff = ((Q2I-meanI)./((Q2I + meanI)./2)).*100;
Q3diff = ((Q3I-meanI)./((Q3I + meanI)./2)).*100;
Q4diff = ((Q4I-meanI)./((Q4I + meanI)./2)).*100;

figure
%semilogx(-Q1I, Q1diff, 'ro')
%hold on 
semilogx(-Q2I, Q2diff, 'bo')
hold on
semilogx(-Q3I, Q3diff, 'ko')

semilogx(-Q4I, Q4diff, 'mo')
xlabel('Channel current (A)')
ylabel('Percentage difference (%)')
%title('Percentage difference of all transistors')
title('Percentage difference of Q2, Q3, and Q4')
limits = [10^(-6) 10^(-2) -50 50]
axis(limits)
legend('M2 difference to mean current', 'M3 difference to mean current', 'M4 difference to mean current')

%legend('M1 difference to mean current', 'M2 difference to mean current', 'M3 difference to mean current', 'M4 difference to mean current')



