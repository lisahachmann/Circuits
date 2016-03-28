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
semilogy(abs(exp2Vg_Vds10mV), abs(exp2I_Vds10mV), 'b*')
hold on
semilogy(abs(exp2ParallelVg_Vds10mV), abs(exp2ParallelI_Vds10mV), 'ro')
semilogy(abs(exp2SeriesVg_Vds10mV), abs(exp2SeriesI_Vds10mV), 'm>')
legend('Single Transistor', 'Parallel circuitry', 'Series circuitry')
title('I-V characterisitcs at Vds = 10mV')
xlabel('Gate voltage (V)')
ylabel('Channel current (A)')