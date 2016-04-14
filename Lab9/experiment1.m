%% Lab 9 experiment 1
% connect the inverting input to a constant voltage source and sweep
% the noninverting input from one rail to the other, measuring Vout for 
% at least three different values of the voltage on the inverting input.
% In your report, include a single plot showing all of these VTCs.

load exp1V1Sweep.csv
load exp1Vout_V2_2V.csv
load exp1Vout_V2_3V.csv
load exp1Vout_V2_4V.csv

plot(exp1V1Sweep, exp1Vout_V2_2V, 'ro-')
hold on
plot(exp1V1Sweep, exp1Vout_V2_3V, 'bo-')
hold on
plot(exp1V1Sweep, exp1Vout_V2_4V, 'ko-')
xlabel('Input voltage at the non-inverting input')
ylabel('Output voltage (V)')
legend('V2 = 2V', 'V2 = 3V', 'V2 = 4V')
title('Voltage Transfer Characteristics')