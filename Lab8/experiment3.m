%experiment 3
%Plot Vout as a function of Vin
%Fit a straight line to the VTC that you obtain.
%Is incremental gain close to unity?
%Plot Vout-Vin vs Vin
%How does offset voltage change as Vin changes?

% 
% load exp3Vin_mon
% load exp3Vout_mon
% load exp3VouotMinusVin_mon

P1 = polyfit((exp3Vin_mon(100:1:500)),(exp3Vout_mon(100:1:500)),1)
Fit_VinVout = P1(1)*(exp3Vin_mon)+P1(2);
P2 = polyfit((exp3Vin_mon(100:1:500)),(exp3VoutMinusVin_mon(100:1:500)),1)
Fit_VinVoutMinusVin = P2(1)*(exp3Vin_mon)+P2(2);



figure
plot(exp3Vin_mon(1:3:500), exp3Vout_mon(1:3:500), 'bo')
hold on
plot(exp3Vin_mon, Fit_VinVout, 'r-', 'linewidth',2)
xlabel('Vin (V)')
ylabel('Vout (V)')
title('Vout v Vin Unity-Gain Follower')

figure
plot(exp3Vin_mon(1:3:500), exp3VoutMinusVin_mon(1:3:500), 'go')
hold on
plot(exp3Vin_mon, Fit_VinVoutMinusVin, 'r-', 'linewidth', 2)
xlabel('Vin (V)')
ylabel('Vout - Vin (V)')
title ('Vout-Vin v Vin Unity-Gain-Follower')