%In your report, include a single plot showing all of these voltage
%transfer characteristics (VTCs). Repeat this experiment for an above-threshold bias 
%current.

load exp1V1Sweep.csv
load exp1Vout_V225.csv
load exp1Vout_V225Vb15.csv
load exp1Vout_V235.csv
load exp1Vout_V235Vb15.csv
load exp1Vout_V245.csv
load exp1Vout_V245Vb15.csv

figure
plot(exp1V1Sweep, exp1Vout_V225, 'bo-')
hold on
plot(exp1V1Sweep, exp1Vout_V235, 'ro-')
hold on
plot(exp1V1Sweep, exp1Vout_V245, 'ko-')
xlabel('V1 voltage sweep (V)')
ylabel('Output voltage (V)')
title('VTC with base voltage at threshold')

figure
plot(exp1V1Sweep, exp1Vout_V225Vb15, 'bo-')
hold on
plot(exp1V1Sweep, exp1Vout_V235Vb15, 'ro-')
hold on
plot(exp1V1Sweep, exp1Vout_V245Vb15, 'ko-')
xlabel('V1 voltage sweep (V)')
ylabel('Output voltage (V)')
title('VTC with base voltage above threshold')