%experiment 2
%Fit a straight line to the steep part of the curve and determine the 
%differential-mode voltage gain of your circuit from the slope
%of the best-fit line. In your report, include a plot showing Vout versus Vdm 
%along with the best-fit line.

load exp2Vdm.csv
load exp2Vout.csv
load exp2Iout_SwV.csv
load exp2VoutSweep.csv

P1 = polyfit(exp2Vdm(150:155),exp2Vout(150:155),1);
yfit1 = P1(1)*exp2Vdm(150:155)+P1(2);

% plot(exp2Vdm, exp2Vout, 'bo');
% hold on
% plot(exp2Vdm(150:155),yfit1,'r');

% Fit a straight line to the shallow part of this output current–voltage
% characteristic, which should correspond to the range of output voltages over
% which the gain of the circuit is large, and determine the
% incremental output resistance of the circuit from the slope of the best-fit
% line. In your report,include a plot showing the output current-voltage 
% characteristic along with the best-fit line.

P2 = polyfit(exp2VoutSweep(90:120),-exp2Iout_SwV(90:120),1);
yfit2 = P2(1)*exp2VoutSweep(90:120)+P2(2);

semilogy(exp2VoutSweep, -exp2Iout_SwV, 'bo')
hold on
semilogy(exp2VoutSweep(90:120), yfit2, 'r', 'Linewidth', 2 )
xlabel('Sweep of the output voltage')
ylabel('Output current')