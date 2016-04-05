%% experiment 1

load I1_V215.csv
load I1_V215Vb2.csv
load I1_V215Vbt.csv
load I1_V220.csv
load I1_V220Vbt.csv
load I1_V220Vb2.csv
load I1_V225.csv
load I1_V225Vbt.csv
load I1_V225Vb2.csv
load I2_V215.csv
load I2_V215Vbt.csv
load I2_V215Vb2.csv
load I2_V220.csv
load I2_V220Vbt.csv
load I2_V220Vb2.csv
load I2_V225.csv
load I2_V225Vbt.csv
load I2_V225Vb2.csv
load V1V2diff.csv
load V_V215.csv
load V_V215Vbt.csv
load V_V215Vb2.csv
load V_V220.csv
load V_V220Vbt.csv
load V_V220Vb2.csv
load V_V225.csv
load V_V225Vbt.csv
load V_V225Vb2.csv
load V1V2diff500.csv


V_V220Vbt= exp(log((V_V215Vbt+V_V225Vbt)./(2)))

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
V1V2diff500 = linspace(-0.4,0.4,500)
figure
plot(V1V2diff500, V_V215Vbt, 'mo')
hold on
plot(V1V2diff500, V_V220Vbt, 'ro')
plot(V1V2diff500, V_V225Vbt, 'bo')
xlabel('Difference in V1 and V2 (V)', 'FontSize', 13)
ylabel('Voltage at node V (V)', 'FontSize', 13)
legend('V2 at 1.5V', 'V2 at 2V', 'V2 at 2.5V', 'FontSize', 11)
title('Vb at Threshold')

figure
plot(V1V2diff, V_V215Vb2, 'mo')
hold on
plot(V1V2diff, V_V220Vb2, 'ro')
plot(V1V2diff, V_V225Vb2, 'bo')
xlabel('Difference in V1 and V2 (V)', 'FontSize', 13)
ylabel('Voltage at node V (V)', 'FontSize', 13)
legend('V2 at 1.5V', 'V2 at 2V', 'V2 at 2.5V', 'FontSize', 11)
title('Vb above threshold')

%For each of the three values of V2 that you used, fit a straight line to the plot of 
%I1 −I2 as a function of V1 − V2 around the region where V1 ≈ V2 (i.e., 
%where V1 − V2 ≈ 0). The slope of this line is approximately equal to the
%(incremental) differential-mode transconductance gain of the differential 
%pair, which is formally given by diff (I1 - I2) / diff(V1-V2)


figure
VbtVdiff = linspace(-0.4, 0.4, 500);
P_below20= polyfit(VbtVdiff(175:325),I1_V220Vbt(175:325)-I2_V220Vbt(175:325),1)
yfit20 = P_below20(1)*VbtVdiff(175:325)+P_below20(2);
P_below15= polyfit(VbtVdiff(175:325),I1_V215Vbt(175:325)-I2_V215Vbt(175:325),1)
yfit15 = P_below15(1)*VbtVdiff(175:325)+P_below15(2);
P_below25= polyfit(VbtVdiff(175:325),I1_V225Vbt(175:325)-I2_V225Vbt(175:325),1)
yfit25 = P_below25(1)*VbtVdiff(175:325)+P_below25(2);
hold on;
I1I2diff15Vbt = I1_V215Vbt - I2_V215Vbt;
plot(VbtVdiff(1:5:500), I1I2diff15Vbt(1:5:500), 'ro')
I1I2diff20Vbt = I1_V220Vbt - I2_V220Vbt;
plot(VbtVdiff(1:5:500), I1I2diff20Vbt(1:5:500), 'bo')
I1I2diff25Vbt = I1_V225Vbt - I2_V225Vbt;
plot(VbtVdiff(1:5:500), I1I2diff25Vbt(1:5:500), 'go')
plot(VbtVdiff(175:325),yfit20,'--k', 'linewidth', 2);
plot(VbtVdiff(175:325),yfit15,'--k', 'linewidth', 2);
plot(VbtVdiff(175:325),yfit25,'--k', 'linewidth', 2);


xlabel('Difference between V1 and V2 (V)')
ylabel('Difference between I1 and I2 (A)')
title('I1-I2 vs V1-V2 characteristic, with Vb at threshold')
legend('Current Difference V2=1.5V','Current Difference V2 = 2V','Current Difference V2=2.5V','Theoretical Fit Lines')
dmGm_below15 = diff(I1_V215Vbt-I2_V215Vbt)/diff(VbtVdiff)
dmGm_below20 = diff(I1_V220Vbt-I2_V220Vbt)/diff(VbtVdiff)
dmGm_below25 = diff(I1_V225Vbt-I2_V225Vbt)/diff(VbtVdiff)

%SAME FOR ABOVE THRESHOLD

P_above20 = polyfit(V1V2diff(75:125),I1_V220Vb2(75:125)-I2_V220Vb2(75:125),1)
yfit20 = P_above20(1)*V1V2diff(75:125)+P_above20(2);
P_above15 = polyfit(V1V2diff(75:125),I1_V215Vb2(75:125)-I2_V215Vb2(75:125),1)
yfit15 = P_above15(1)*V1V2diff(75:125)+P_above15(2);
P_above25 = polyfit(V1V2diff(75:125),I1_V225Vb2(75:125)-I2_V225Vb2(75:125),1)
yfit25 = P_above25(1)*V1V2diff(75:125)+P_above25(2);


I1I2diff20VbAbove = I1_V220Vb2 - I2_V220Vb2;
I1I2diff15VbAbove = abs(I1_V215Vb2) - abs(I2_V215Vb2);
I1I2diff25VbAbove = I1_V225Vb2 - I2_V225Vb2;

figure


plot(V1V2diff(1:2:200), I1I2diff15VbAbove(1:2:200), 'ro')
hold on
plot(V1V2diff(1:2:200), I1I2diff20VbAbove(1:2:200), 'bo')
plot(V1V2diff(1:2:200), I1I2diff25VbAbove(1:2:200), 'go')

plot(V1V2diff(75:125),yfit15,'--k', 'linewidth', 2);
plot(V1V2diff(75:125),yfit20,'--k', 'linewidth', 2)
plot(V1V2diff(75:125),yfit25,'--k', 'linewidth', 2);

xlabel('Difference between V1 and V2 (V)')
ylabel('Difference between I1 and I2 (A)')
title('I1-I2 vs V1-V2 characteristic, with Vb above threshold')
legend('Current Difference V2=1.5V','Current Difference V2 = 2V','Current Difference V2=2.5V','Theoretical Fit Lines')

dmGm_above15 = diff(I1_V215 - I2_V215)/diff(V1V2diff)
dmGm_above20 = diff(I1_V220 - I2_V220)/diff(V1V2diff)
dmGm_above25 = diff(I1_V225 - I2_V225)/diff(V1V2diff)








%Make plot similar to the ones that you made for the lower bias current