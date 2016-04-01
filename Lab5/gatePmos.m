%%Gate characteristics, pMOS transistor
load exp1pMOSVgSI.csv
load exp1pMOSVgWI.csv
load exp1pMOSIchSI.csv
load exp1pMOSIchWI.csv

%There are 70 data points of WI and 100 of SI. 
%The WI range was considered Vg 0.5-1.75, and SI to be 1.75-5, so the 1.75V
%data point has been removed from WI (that's why it's ranged to be until
%the 69th data poing). The step for SI is currently on every second data
%point. 

VgP = [exp1pMOSVgWI(1:69), exp1pMOSVgSI(1:2:100)];
IchP = [exp1pMOSIchWI(1:69), exp1pMOSIchSI(1:2:100)];
semilogy(VgP, IchP,'ro')
xlabel('Gate voltage (V)')
ylabel('Channel current (A)')
title('Gate characteristics of a pMOS transistor')

% the EKV fit is then called using VgP and IchP