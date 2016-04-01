%%Experiment 2

load exp2I_Vds10mV.csv
load exp2I_VdsVdd.csv
load exp2Vg_Vds10mV.csv
load exp2Vg_VdsVdd.csv
load exp2ParallelI_Vds10mV.csv
load exp2ParallelI_VdsVdd.csv
load exp2ParallelVg_Vds10mV.csv
load exp2ParallelVg_VdsVdd.csv
load exp2Vg_Vds10mV.csv
load exp2Vg_VdsVdd.csv
load exp2SeriesI_Vds10mV.csv
load exp2SeriesI_VdsVdd.csv
load exp2SeriesVg_Vds10mV.csv
load exp2SeriesVg_VdsVdd.csv
load exp2Vg_Vds10mV.csv
load exp2Vg_VdsVdd.csv

% a single semilog plot showing data from the individual transistor, the parallel 
%connection, and the series connection, for each of the two experimental situations
figure
semilogy(abs(exp2Vg_VdsVdd), abs(exp2I_VdsVdd), 'b*')
hold on
semilogy(abs(exp2ParallelVg_VdsVdd), abs(exp2ParallelI_VdsVdd), 'ro')
semilogy(abs(exp2SeriesVg_VdsVdd), abs(exp2SeriesI_VdsVdd), 'm>')
legend('Single Transistor', 'Parallel circuitry', 'Series circuitry')
title('I-V characterisitcs at Vds = Vdd (5V)')
xlabel('Gate voltage (V)')
ylabel('Channel current (A)')

figure
semilogy(abs(exp2Vg_Vds10mV(25:500)), abs(exp2I_Vds10mV(25:500)), 'b*')
hold on
semilogy(abs(exp2ParallelVg_Vds10mV(25:500)), abs(exp2ParallelI_Vds10mV(25:500)), 'ro')
semilogy(abs(exp2SeriesVg_Vds10mV(25:500)), abs(exp2SeriesI_Vds10mV(25:500)), 'm>')
legend('Single Transistor', 'Parallel circuitry', 'Series circuitry')
title('I-V characterisitcs at Vds = 10mV')
xlabel('Gate voltage (V)')
ylabel('Channel current (A)')

%Also, include plots showing  the ratio of the measurements from the parallel connection
%to those from the individual transistor and the ratio of the
%individual transistor measurements to those from the series
% connection

ratiopIVdd = exp2ParallelI_VdsVdd./exp2I_VdsVdd;
ratiosIVdd = exp2SeriesI_VdsVdd./exp2I_VdsVdd;
 
ratiopI10 = exp2ParallelI_Vds10mV./exp2I_Vds10mV;
ratiosI10 = exp2SeriesI_Vds10mV./exp2I_Vds10mV;
Vg10 = exp2Vg_Vds10mV
%Vds at Vdd

figure
plot(exp2Vg_Vds10mV, (ratiosI10), 'o')
hold on
plot(exp2Vg_Vds10mV, (ratiopI10), 'ro')

xlabel('Gate voltage (V)')
ylabel('Ratio of currents')
legend('Ratio of series to individual transistors', 'Ratio of parallel to individual transistors')
title('Ratios of transistor circuitry, using Vds = Vdd (5V)')

%Vds at 10mV
% figure
% plot(exp2Vg_Vds10mV, ratiosI10, 'Linewidth', 2)
% hold on
% plot(exp2Vg_Vds10, ratiopI10, 'r', 'Linewidth', 2)
% xlabel('Gate voltage (V)')
% ylabel('Ratio of currents')
% legend('Ratio of series to individual transistors', 'Ratio of parallel to individual transistors')
% title('Ratios of transistor circuitry, using Vds = 10mV')
% 
