%% Lab 9 experiment 2
% You should try to get several points in the high-gain region. 
% Fit a straight line to the steep part of the curve and determine
% the differential-mode voltage gain of your circuit from the slope
% of the best-fit line. In your report, include a plot showing Vout
% versus Vdm along with the best-fit line

load exp2IoutSweepVout.csv
load exp2IoutSweepVdm.csv
load exp2V1V2Diff.csv
load exp2VdmSweep.csv
load exp2Vout_V2_2V.csv
load exp2VoutSweep.csv

P = polyfit(exp2V1V2Diff(251:261),exp2Vout_V2_2V(251:261),1);
yfit = P(1)*exp2V1V2Diff(251:261)+P(2);

figure
plot(exp2V1V2Diff, exp2Vout_V2_2V, 'ro')
hold on
plot(exp2V1V2Diff(251:261),yfit, 'k')
xlabel('Vdm (V)')
ylabel('Output voltage (V)')
legend('Measured data', 'Theoretical best fit')
title('Gain of amplifier with V2 = 2V')

% Next, set the differential-mode input voltage to zero and measure the 
% current flowing into the output of the amplifier as you sweep Vout from 
% one rail to the other. Fit a straight line to the shallow part of this
% output current–voltage characteristic, which should correspond
% to the range of output voltages over which the gain of the circuit is
% large, and determine the incremental output resistance of the circuit 
% from the slope of the best-fit line. In your report, include a plot showing
% the output current-voltage characteristic along with the best-fit line.

P1 = polyfit(exp2VoutSweep(100:400),exp2IoutSweepVout(100:400),1);
yfit1 = P1(1)*exp2VoutSweep(100:400)+P1(2);

figure 
limits = [0, 5, 1e-7, 0.5e-5]
semilogy(exp2VoutSweep, exp2IoutSweepVout, 'ro')
hold on
semilogy(exp2VoutSweep(100:400), yfit1, 'b', 'linewidth', 3)
xlabel('Output voltage (V)')
ylabel('Output current (A)')
title('Iout vs Vout')
axis(limits)
legend('Measured data', 'Best fit line')
title('Output voltage-current characteristics')

% Finally, fix the output voltage somewhere in the range of output voltages
% for which the circuit’s gain is large and measure the current flowing out
% of the amplifier as you sweep Vdm around  around zero. You should sweep 
% Vdm over a sufficiently large range that Iout saturates both
% for positive and for negative values of Vdm. 

%  Fit a straight line to the curve around where Vdm = 0 and extract a
% value of the incremental transconductance gain of the circuit with the
% output voltage fixed from the slope of the best-fit line. Also, record
%the limiting values of Iout in both the positive and the negative 
% directions. In your report, include a plot showing Iout versus Vdm along
%with the best-fit line.