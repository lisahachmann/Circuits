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
load V1V2diff500.csv

%include a single plot showing I1, I2, I1 − I2, and I1 + I2, as a function of V1 − V2 for 
%all three values of V2 that you used. 

I1I2diff20Vbt = abs(I1_V220Vbt) - abs(I2_V220Vbt);
I1I2sum20Vbt = (abs(I1_V220Vbt) + abs(I2_V220Vbt));
I1I2diff15Vbt = abs(I1_V215Vbt) - abs(I2_V215Vbt);
I1I2sum15Vbt = (abs(I1_V215Vbt) + abs(I2_V215Vbt));
I1I2diff25Vbt = abs(I1_V225Vbt) - abs(I2_V225Vbt);
I1I2sum25Vbt = abs(I1_V225Vbt) + abs(I2_V225Vbt);

figure 
semilogy(V1V2diff500(1:4:500),  abs(I1_V215Vbt(1:4:500)), 'r>')
hold on
semilogy(V1V2diff500(1:4:500), abs(I2_V215Vbt(1:4:500)), 'b>')
semilogy(V1V2diff500(1:4:500), abs(I1I2diff15Vbt(1:4:500)), 'm>')
semilogy(V1V2diff500(1:4:500), abs(I1I2sum15Vbt(1:4:500)), 'g>')
semilogy(V1V2diff500(1:4:500),  abs(I1_V220Vbt(1:4:500)), 'ro')
semilogy(V1V2diff500(1:4:500), abs(I2_V220Vbt(1:4:500)), 'bo')
semilogy(V1V2diff500(1:4:500), abs((I1I2diff20Vbt(1:4:500))), 'mo')
semilogy(V1V2diff500(1:4:500), abs(I1I2sum20Vbt(1:4:500)), 'go')
semilogy(V1V2diff500(1:4:500),  abs(I1_V225Vbt(1:4:500)), 'r*')
semilogy(V1V2diff500(1:4:500), abs(I2_V225Vbt(1:4:500)), 'b*')
semilogy(V1V2diff500(1:4:500), abs(I1I2diff25Vbt(1:4:500)), 'm*')
semilogy(V1V2diff500(1:4:500), abs(I1I2sum25Vbt(1:4:500)), 'g*')
title('Currents Vs V1-V2')
xlabel('Difference in voltage between V1 and V2, (Voltage)', 'FontSize', 11)
ylabel('Current (Amps)', 'FontSize', 11)
legend('I1 V2=1.5V', 'I2 V2=1.5V', '|I1-I2| V2=1.5V', 'I1+I2 V2=1.5V', 'I1 V2=2V', 'I2 V2=2V', '|I1-I2| V2=2V', 'I1+I2 V2=2V', 'I1 V2=2.5V', 'I2 V2=2.5V', '|I1-I2| V2=2.5V', 'I1+I2 V2=2.5V')  



%Also include a plot showing the common-source node voltage,
%V , as a function of V1 − V2 for all three values of V2. 

figure
plot(V1V2diff, V_V215, 'mo')
hold on
plot(V1V2diff, V_V220, 'ro')
plot(V1V2diff, V_V225, 'bo')
xlabel('Difference in V1 and V2 (V)', 'FontSize', 13)
ylabel('Voltage at node V (V)', 'FontSize', 13)
legend('V2 at 1.5V', 'V2 at 2V', 'V2 at 2.5V', 'FontSize', 11)

%For each of the three values of V2 that you used, fit a straight line to the plot of 
%I1 −I2 as a function of V1 − V2 around the region where V1 ≈ V2 (i.e., 
%where V1 − V2 ≈ 0). The slope of this line is approximately equal to the
%(incremental) differential-mode transconductance gain of the differential 
%pair, which is formally given by diff (I1 - I2) / diff(V1-V2)
figure
VbtVdiff = linspace(-0.4, 0.4, 500);
P_below= polyfit(VbtVdiff(175:325),I1_V220Vbt(175:325)-I2_V220Vbt(175:325),1);
yfit = P_below(1)*VbtVdiff(175:325)+P_below(2);
hold on;
figure
plot(VbtVdiff(175:325),yfit,'r', 'Markersize', 20);
hold on
plot(VbtVdiff, I1_V220Vbt - I2_V220Vbt, 'bo')
xlabel('Difference between V1 and V2 (V)')
ylabel('Difference between I1 and I2 (A)')
title('I1-I2 vs V1-V2 characteristic, with Vb at threshold')
legend('Theoretical fit line', 'Data of different voltages and currents')
dmGm_below = diff(I1_V220Vbt-I2_V220Vbt)/diff(VbtVdiff);

hold on
figure
P_above = polyfit(V1V2diff(75:125),I1_V220(75:125)-I2_V220(75:125),1);
yfit = P_above(1)*V1V2diff(75:125)+P_above(2);
hold on;
figure
plot(V1V2diff(75:125),yfit,'r', 'Markersize', 20);
hold on
plot(V1V2diff, I1_V220 - I2_V220, 'bo')
xlabel('Difference between V1 and V2 (V)')
ylabel('Difference between I1 and I2 (A)')
title('I1-I2 vs V1-V2 characteristic, with Vb above threshold')
legend('Theoretical fit line', 'Data of different voltages and currents')
dmGm_above = diff(I1_V220 - I2_V220)/diff(V1V2diff)

%include a single plot showing I1, I2, I1 − I2, and I1 + I2, as a function of V1 − V2 for 
%all three values of V2 that you used. 

% VbtVdiff = linspace(-0.4, 0.4, 500)
% 
% figure 
% semilogy(VbtVdiff,  I1_V220Vbt, 'ro', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff, I2_V220Vbt, 'bo', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff, I1_V220Vbt - I2_V220Vbt, 'mo', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff, I1_V220Vbt + I2_V220Vbt, 'ko', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff,  I1_V215Vbt, 'r>', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff, I2_V215Vbt, 'y>', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff, I1_V215Vbt - I2_V215Vbt, 'm>', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff, I1_V215Vbt + I2_V215Vbt, 'k>', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff,  I1_V225Vbt, 'r*', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff, I2_V225Vbt, 'b*', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff, I1_V225Vbt - I2_V225Vbt, 'm*', 'Markersize', 12)
% hold on
% semilogy(VbtVdiff, I1_V225Vbt + I2_V225Vbt, 'k*', 'Markersize', 12)
% 
% xlabel('Difference in voltage between V1 and V2, (Voltage)', 'FontSize', 13)
% ylabel('Difference in current between I1 and I2 (Amps)', 'FontSize', 13)
