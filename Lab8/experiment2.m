%experiment 2
%Fit a straight line to the steep part of the curve and determine the 
%differential-mode voltage gain of your circuit from the slope
%of the best-fit line. In your report, include a plot showing Vout versus Vdm 
%along with the best-fit line.

load exp2Vdm.csv
load exp2Vout.csv
load exp2Iout_SwV.csv
load exp2VoutSweep.csv
load exp2Iout_SwVdm_VoutFixed.csv
load exp2VoutFixed.csv

P1 = polyfit(exp2Vdm(245:260),exp2Vout(245:260),1);
yfit1 = P1(1)*exp2Vdm(245:260)+P1(2);
% limits= [-0.3, 0.3, 1, 5.25]

% figure
% plot(exp2Vdm, exp2Vout, 'bo');
% hold on
% plot(exp2Vdm(245:260),yfit1,'r', 'Linewidth', 2);
% xlabel('V1-V2 (V)')
% ylabel('Output voltage (V)')
% axis(limits)
% legend('Data Measurements', 'Theoretical fit line')

% Fit a straight line to the shallow part of this output current–voltage
% characteristic, which should correspond to the range of output voltages over
% which the gain of the circuit is large, and determine the
% incremental output resistance of the circuit from the slope of the best-fit
% line. In your report,include a plot showing the output current-voltage 
% characteristic along with the best-fit line.

P2 = polyfit(exp2VoutSweep(90:300),-exp2Iout_SwV(90:300),1);
yfit2 = P2(1)*exp2VoutSweep(90:300)+P2(2);

% figure
% plot(exp2VoutSweep, -exp2Iout_SwV, 'bo')
% hold on
% plot(exp2VoutSweep(90:300), yfit2, 'r', 'Linewidth', 2 )
% xlabel('Sweep of the output voltage')
% ylabel('Output current')

% Fit a straight line to the curve around where V1 = V2 and extract a
% value of the incremental transconductance gain of the circuit with the output 
% voltage fixed from the slope of the best-fit line. In your report, include a plot 
% showing Iout versus Vdm along with the best-fit line

P4 = polyfit(exp2Vdm(200:300),-exp2Iout_SwVdm_VoutFixed(200:300),1);
yfit4 = P4(1)*exp2Vdm(200:300)+P4(2);

figure
plot(exp2Vdm, -exp2Iout_SwVdm_VoutFixed, 'bo')
hold on
plot(exp2Vdm(200:300),yfit4, 'r', 'Linewidth', 2)
xlabel('Vdm (V)')
ylabel('Output Current with output voltage fixed at 2V (A)')
legend('Data Measurements', 'Theoretical best fit line')