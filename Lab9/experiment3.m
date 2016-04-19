%%Lab 9 
%experiment 3

load Large5kHz2V.csv
load SmallWave_Zoomed.csv
load SmallWave_ZoomedOut.csv

% Apply a small-amplitude square wave to the input of your circuit and observe both the
%input and output waveforms as a function of time.
%Extract a time constant both for the up-going and for the down-going
%output transitions. How do these compare with that which you compute from the measured
%values of the load capacitance and the differential-mode transconductance gain that you
%found in Experiment 2? In your report, include a single plot showing both scope traces
%along with the extracted time constants.

t = SmallWave_Zoomed(:,1);
tcut= t(3100:6000);
Vout = SmallWave_Zoomed(:,3);
Voutcut = Vout(3100:6000);
Vin = SmallWave_Zoomed(:,2);
Vincut = Vin(3100:6000);

% figure 
% limits = [0.5*10^(-4), 1.5*10^(-4), 0, 2.6];
% axis(limits)
% plot(tcut, Voutcut)
% hold on
% Tau = 0.0072;
% y1 = Vincut.*(1 - exp(-tcut./Tau));
% plot(tcut, y1, 'k')

%Next, increase the amplitude of your square wave so that it is a couple of volts.
%You will probably notice that the output
%of the amplifier follows a linear trajectory in time over most of its response 
%to the large input step. This behavior is called slewing, and the constant rate
%of change of the output voltage with respect to time is called the slew rate 
%of the amplifier. Extract a slew rate for both for the up-going and for the down-going 
%output transitions. How do these compare with those which you compute from the load 
%capacitance and the limiting values of the output current?
%In your report, include a single plot showing both scope traces along with 
%the extracted slew rates.
% 

tl = Large5kHz2V(:,1)
tlcut = tl(1200:2600);
sigl = Large5kHz2V(:,3);
siglcut = sigl(1200:2600);

P4 = polyfit(tlcut,siglcut,1);
yfit4 = P4(1)*tlcut+P4(2);

figure
plot(Large5kHz2V(:,1), Large5kHz2V(:,2), 'r')
hold on
plot(Large5kHz2V(:,1), Large5kHz2V(:,3), 'b')
plot(tlcut, yfit4, 'k', 'linewidth', 2)
xlabel('Time (sec)')
ylabel('Voltage (V)')
legend('Input signal', 'Output signal', 'Best fit line')