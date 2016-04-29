load delay1.csv
load sixtranr1s0_to_r1s1.csv %%ref as r1s0
load sixtranr1s1_to_r0s0.csv %%ref as r1s1
load sixtrans1r0_to_r1s0.csv %%ref as s1r0

time = delay1(:,1);
C1 = delay1(:,2);
C2 = delay1(:,3);
x = 6565:6570;

% figure
% plot(time(x), C1(x))
% hold on
% plot(time(x), C2(x))
% xlabel('Time (seconds)')
% ylabel('Voltage (V)')
% title('Time delay of simple SR latch circuit')

r1s0 = sixtranr1s0_to_r1s1;
r1s1 = sixtranr1s1_to_r0s0; 
s1r0 = sixtrans1r0_to_r1s0;

% figure
% limits = [-5.5, 4 , -0.1, 5.5];
% axis(limits);
% plot(r1s0(:,1), r1s0(:,2), 'linewidth', 2);
% hold on
% plot(r1s0(:,1), r1s0(:,3), 'linewidth', 2);
% xlabel('Time (sec)')
% ylabel('Voltage (V)')
% title('')
%legend('Q', Qnot')

figure
plot(r1s1(:,1), r1s1(:,2))
hold on
plot(r1s1(:,1), r1s1(:,3))
xlabel('Time (sec)')
ylabel('Voltage (V)')
title('R=1 and S=1 to R=0 and S=0')

figure
plot(s1r0(:,1), s1r0(:,2))
hold on
plot(s1r0(:,1), s1r0(:,3))
xlabel('Time (sec)')
ylabel('Voltage (V)')
title('S=1 and R=1 to R=0 and S=0')