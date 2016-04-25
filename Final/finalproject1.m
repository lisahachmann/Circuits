load delay1.csv

time = delay1(:,1);
C1 = delay1(:,2);
C2 = delay1(:,3);
x = 6565:6570;

plot(time(x), C1(x))
hold on
plot(time(x), C2(x))
xlabel('Time (seconds)')
ylabel('Voltage (V)')
title('Time delay of simple SR latch circuit')