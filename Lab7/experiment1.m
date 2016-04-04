%% experiment 1

load I1_V215.csv
load I1_V215Vbt.csv
load I1_V220.csv
load I1_V220Vbt.csv
load I1_V225.csv
load I1_V225Vbt.csv
load I2_V215.csv
load I2_V215Vbt.csv
load I2_V220.csv
load I2_V220Vbt.csv
load I2_V225.csv
load I2_V225Vbt.csv
load V1V2diff.csv
load V_V215.csv
load V_V215Vbt.csv
load V_V220.csv
load V_V220Vbt.csv
load V_V225.csv
load V_V225Vbt.csv

%include a single plot showing I1, I2, I1 − I2, and I1 + I2, as a function of V1 − V2 for 
%all three values of V2 that you used. 

figure 
semilogy(V1V2diff,  I1_V220, 'ro', 'Markersize', 12)
hold on
semilogy(V1V2diff, I2_V220, 'bo', 'Markersize', 12)
hold on
semilogy(V1V2diff, I1_V220 - I2_V220, 'mo', 'Markersize', 12)
hold on
semilogy(V1V2diff, I1_V220 + I2_V220, 'ko', 'Markersize', 12)
hold on
% semilogy(V1V2diff,  I1_V215, 'r>', 'Markersize', 12)
hold on
semilogy(V1V2diff, I2_V215, 'y>', 'Markersize', 12)
% hold on
% semilogy(V1V2diff, I1_V215 - I2_V215, 'm>', 'Markersize', 12)
% hold on
% semilogy(V1V2diff, I1_V215 + I2_V215, 'k>', 'Markersize', 12)
hold on
semilogy(V1V2diff,  I1_V225, 'r*', 'Markersize', 12)
hold on
semilogy(V1V2diff, I2_V225, 'b*', 'Markersize', 12)
hold on
semilogy(V1V2diff, I1_V225 - I2_V225, 'm*', 'Markersize', 12)
hold on
semilogy(V1V2diff, I1_V225 + I2_V225, 'k*', 'Markersize', 12)

xlabel('Difference in voltage between V1 and V2, (Voltage)', 'FontSize', 13)
ylabel('Difference in current between I1 and I2 (Amps)', 'FontSize', 13)

%Also include a plot showing the common-source node voltage,
%V , as a function of V1 − V2 for all three values of V2. 

figure
plot(V1V2diff, V_V215, 'mo')
hold on
plot(V1V2diff, V_V220, 'ro')
hold on
plot(V1V2diff, V_V225, 'bo')
xlabel('Difference in V1 and V2 (V)', 'FontSize', 13)
ylabel('Voltage at node V (V)', 'FontSize', 13)
legend('V2 at 1.5V', 'V2 at 2V', 'V2 at 2.5V', 'FontSize', 11)

%For each of the three values of V2 that you used, fit a straight line to the plot of 
%I1 −I2 as a function of V1 − V2 around the region where V1 ≈ V2 (i.e., 
%where V1 − V2 ≈ 0). The slope of this line is approximately equal to the
%(incremental) differential-mode transconductance gain of the differential 
%pair, which is formally given by diff (I1 - I2) / diff(V1-V2)


%Make plot similar to the ones that you made for the lower bias current