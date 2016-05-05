%Von=Utlog(Ion/Is)
Ut = 0.026;
Ion1 = 5*10^-5;
Ion2 = 5*10^-6;
Ion3 = 2.5*10^-6;
Is =8.92*10^(-15);
Von1 = Ut*log(Ion1/Is)

Von2 = Ut*log(Ion2/Is)

Von3 = Ut*log(Ion3/Is)

R = [470, 4700, 10000];
Von = [Von1, Von2, Von3]
Ion = [Ion1, Ion2, Ion3]

figure
plot(R,Von, '*--', 'markersize', 10)
xlabel('R(ohms)')
ylabel('Von (V)')
title('Plot of Von vs R')

figure
plot(R,Ion, '*--', 'markersize', 10)
xlabel('R(ohms)')
ylabel('Ion (A)')
title('Plot of Ion vs R')