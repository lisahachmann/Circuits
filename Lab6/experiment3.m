%% Experiment 3

load exp3Iina.csv
load exp3Iinb.csv
load exp3Ioutb.csv
load exp3Iouta.csv

%Circuit a
figure
plot(abs(exp3Iina), abs(exp3Iouta), 'ro')
P2 = polyfit(abs(exp3Iina(110:200)),abs(exp3Iouta(110:200)),1);
y2fit = 0.5077*abs(exp3Iina) + 10e-10 ;
hold on;
x = logspace(-10, -2, 100);
y = 0.5.*x + 3.59e-07;
plot(x, y)
%loglog(abs(exp3Iina),y2fit,'k', 'LineWidth', 2);
xlabel('Input current (Iin) (A) sunk from sources')
ylabel('Output current of 1 branch (I1) (A) taken at drains')
title('Current Divider, with slope = 0.5077')
legend('Measured data','Theoretical (slope = 0.5)')

%Circuit b
figure
plot(abs(exp3Iinb), abs(exp3Ioutb), 'ro')
P = polyfit(abs((exp3Iinb(110:200))),abs((exp3Ioutb(110:200))),1);
yfit = P(1)*abs(exp3Iinb(110:200))+P(2);
hold on;
x = logspace(-10, -2, 100);
y = .5.*x + 3.59e-07;
plot(x, y)
xlabel('Input current (Iin) (A) sourced into drains')
ylabel('Output current of 1 branch (I1) (A) taken at sources')
title('Current Divider, with slope = 0.4938')
legend('Measured data','Theoretical (slope = 0.5)')
