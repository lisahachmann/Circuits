load Vacross_R1_SwVin.csv
load Vacross_R2_SwVin.csv
load Vacross_R3_SwVin.csv
load Vin_R1.csv
load Vin_R2.csv
load Vin_R3.csv
load Current_R1_SwVin.csv
load Current_R2_SwVin.csv
load Current_R3_SwVin.csv

Is = 8.92*10^(-15);
Ut = 0.026;
Itheory1 = Is*(exp(Vacross_R1_SwVin/Ut)-1);

plot(Vin_R1, Current_R1_SwVin, 'o')
hold on
plot(Vin_R1, Itheory1, 'linewidth', 2)
xlabel('Applied Voltage (V)', 'fontsize', 13)
ylabel('Current (A)', 'fontsize', 13)
title('Current as function of applied voltage for R = 470 ohm', 'fontsize', 16)
legend('Measured data', 'Theoretical fit', 'fontsize', 11)
 
Itheory2 = Is*(exp(Vacross_R2_SwVin/Ut)-1);

figure 
plot(Vin_R2, Current_R2_SwVin, 'o')
hold on
plot(Vin_R2, Itheory2, 'linewidth', 2)
xlabel('Applied Voltage (V)', 'fontsize', 13)
ylabel('Current (A)', 'fontsize', 13)
title('Current as function of applied voltage for R = 4.7 Kohm', 'fontsize', 16)
legend('Measured data', 'Theoretical fit', 'fontsize', 11)
 
Itheory3 = Is*(exp(Vacross_R3_SwVin/Ut)-1);
 
figure 
plot(Vin_R3, Current_R3_SwVin, 'o')
hold on
plot(Vin_R3, Itheory3, 'linewidth', 2)
xlabel('Applied Voltage (V)', 'fontsize', 13)
ylabel('Current (A)', 'fontsize', 13)
title('Current as function of applied voltage for R = 10 Kohm', 'fontsize', 16)
legend('Measured data', 'Theoretical fit', 'fontsize', 11)

figure
limits = [0 5 10^(-10) 1];
axis(limits);
semilogy(Vin_R1, Current_R1_SwVin, 'o')
hold on
semilogy(Vin_R1, Itheory1, 'linewidth', 2)
semilogy(Vin_R2, Current_R2_SwVin, 'o')
semilogy(Vin_R2, Itheory2, 'linewidth', 2)
semilogy(Vin_R3, Current_R3_SwVin, 'o')
semilogy(Vin_R3, Itheory3, 'linewidth', 2)
xlabel('Applied Voltage (V)', 'fontsize', 13)
ylabel('Current (A)', 'fontsize', 13)
title('Current as function of applied voltage for various R', 'fontsize', 16)
legend('R=470 ohm Measured data', 'R=470 ohm Theoretical fit', 'R=4.7K ohm Measured data', 'R=4.7K Theoretical fit', 'R=10K Measured data', 'R=10Kohm Theoretical fit')