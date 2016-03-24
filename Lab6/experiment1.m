%% Experiment 1

load exp1nMOSQ1I.csv
load exp1nMOSQ1Vg.csv
load exp1nMOSQ2I.csv
load exp1nMOSQ2Vg.csv
% load exp1nMOSQ3I.csv
% load exp1nMOSQ3Vg.csv

Q1Iweak = exp1nMOSQ1I(1:70);
Q1Vgweak = exp1nMOSQ1Vg(1:70);
Q1Istrong = exp1nMOSQ1I(70:4:500);
Q1Vgstrong = exp1nMOSQ1Vg(70:4:500);

Q1I = [Q1Iweak, Q1Istrong];
Q1Vg = [Q1Vgweak, Q1Vgstrong];
% Q2I = [Q2Iweak, Q2Istrong];
% Q2Vg = [Q2Vgweak, Q2Vgstrong];
% Q3I = [Q3Iweak, Q3Istrong];
% Q3Vg = [Q3Vgweak, Q3Vgstrong];
% Q3I = [Q3Iweak, Q3Istrong];
% Q3Vg = [Q3Vgweak, Q3Vgstrong];
% Q4I = [Q4Iweak, Q4Istrong];
% Q4Vg = [Q4Vgweak, Q4Vgstrong];

semilogy(Q1Vgweak, Q1Iweak, 'ro')
hold on
semilogy(Q1Vgstrong, Q1Istrong, 'r*')
hold on
% semilogy(Q2Vgweak, Q2Iweak, 'ko')
% hold on
% semilogy(Q2Vgstrong, Q2Istrong, 'k*')
% hold on
% semilogy(Q3Vgweak, Q3Iweak, 'bo')
% hold on
% semilogy(Q3Vgstrong, Q3Istrong, 'b*')
% hold on
% semilogy(Q4Vgweak, Q4Iweak, 'mo')
% hold on
% semilogy(Q4Vgstrong, Q4Istrong, 'm*')