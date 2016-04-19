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

% if you want the graph zoomed in
t = SmallWave_Zoomed(:,1);
tcut= t(3100:6000);
Vout = SmallWave_Zoomed(:,3);
Voutcut = Vout(3100:6000);
Vin = SmallWave_Zoomed(:,2);
Vincut = Vin(3100:6000);
 
figure 
plot(t, Vin, 'r')
hold on
plot(t, Vout)
hold on
V = 2.5;
gm = 4.498*10^(-5);
C = 1*10^-9;
Tau = (1/gm)*C;
y1 = V.*(1 - exp(-tcut./Tau));
plot(tcut, y1, 'k')
xlabel('Time (sec)')
ylabel('Voltage (V)')
legend('Input voltage signal', 'Output voltage signal', 'Theoretical fit')

% if you want it zoomed out
tZ = SmallWave_ZoomedOut(:,1);
VinZ = SmallWave_ZoomedOut(:,2);
VoutZ = SmallWave_ZoomedOut(:,3);
tZstepup = tZ(2200:2450);
VinZstepup = VinZ(2200:2450);
VoutZstepup = VoutZ(2200:2450);
tZstepdown = tZ(6250:6500);
VinZstepdown = VinZ(6250:6500);
VoutZstepdown = VoutZ(6250:6500);

% figure
% plot(tZ, VinZ, 'r')
% hold on 
% plot(tZ, VoutZ)
% %plot(tZstepup, VoutZstepup, 'ko')
% %plot(tZstepdown, VoutZstepdown, 'mo')
% V = 2.5;
% gm = 4.498*10^(-5);
% C = 1*10^-9;
% Tau = (1/gm)*C;
% y2 = V.*(1 - exp(-tZstepup./Tau));
% y3 = V.*(1 - exp(-tZstepdown./Tau));
% %plot(tZstepup, y2, 'ko', 'Markersize', 5)
% %plot(tZstepdown, y3, 'mo')
% xlabel('Time (sec)')
% ylabel('Voltage (V)')
% legend('Input voltage signal', 'Output voltage signal', 'Theoretical fit')

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

% tl = Large5kHz2V(:,1)
% tlcut = tl(1200:2600);
% sigl = Large5kHz2V(:,3);
% siglcut = sigl(1200:2600);
% 
% P4 = polyfit(tlcut,siglcut,1);
% yfit4 = P4(1)*tlcut+P4(2);
% 
% figure
% plot(Large5kHz2V(:,1), Large5kHz2V(:,2), 'r')
% hold on
% plot(Large5kHz2V(:,1), Large5kHz2V(:,3), 'b')
% plot(tlcut, yfit4, 'k', 'linewidth', 2)
% xlabel('Time (sec)')
% ylabel('Voltage (V)')
% legend('Input signal', 'Output signal', 'Best fit line')