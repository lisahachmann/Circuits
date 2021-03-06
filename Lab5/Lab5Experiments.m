load exp1nMOSIch.csv
load nMOSIg.csv
load nMOSVch.csv
load exp1nMOSVg.csv
load pMOSIch.csv
load pMOSIg.csv
load pMOSVch.csv
load pMOSVg.csv
load exp1pMOSVg.csv
load exp1pMOSIch.csv

load exp1pMOSVgSI.csv
load exp1pMOSVgWI.csv
load exp1pMOSIchSI.csv
load exp1pMOSIchWI.csv

load exp1nMOSIchstrong.csv
load exp1nMOSIchweak.csv
load exp1nMOSVgstrong.csv
load exp1nMOSVgweak.csv

load exp1pMOSIchstrong.csv
load exp1pMOSVgstrong.csv
%% Gate characteristics

Ut = 0.025;

VgnMOS = exp1nMOSVgweak, exp1nMOSVgstrong;
IchnMOS = exp1nMOSIchweak, exp1nMOSIchstrong;

VgpMOS = exp1pMOSVgWI, exp1pMOSVgSI;
IchpMOS = exp1pMOSIchWI, exp1pMOSIchSI;

semilogy(exp1pMOSVgstrong, exp1pMOSIchstrong)
VgPmosweak = exp1pMOSVg(171:200);
VgPmosstrong = exp1pMOSVg(1:170);
IchPmosweak = exp1pMOSIch(171:200);
IchPmosstrong = exp1pMOSIch(1:170);
% %  
VgP = [exp1pMOSVgWI(1:69), exp1pMOSVgSI(1:2:100)];
IchP = [exp1pMOSIchWI(1:69), exp1pMOSIchSI(1:2:100)];
% semilogy(exp1pMOSVgWI, exp1pMOSIchWI, 'r')
% hold on
% semilogy(exp1pMOSVgSI, exp1pMOSIchSI, 'k')
% hold on
kappan = 0.6452 ;
Isn  = 1.941e-6;
VTn = 0.6748 ;
kappap = 0.8123;
Isp = 5.6749e-7;
VTp = 0.7688;
In = Isn * (log(1 + exp(kappan*(VgnMOS - VTn)/(2*Ut)))).^2
Ip = Isp * (log(1 + exp(kappap*(abs(VgpMOS) - VTp)/(2*Ut)))).^2
semilogy(abs(VgnMOS), abs(In), 'r')
hold on
semilogy(abs(VgnMOS), abs(IchnMOS), 'ko')
hold on
semilogy(abs(VgpMOS), abs(IchpMOS) , 'm*')
hold on
semilogy(abs(VgpMOS), Ip,'b')

%check raw data
% subplot(1,2,1)
% semilogy(VgnMOS, -IchnMOS, 'bo')
% hold on
% semilogy(exp1nMOSVg(1:45), exp1nMOSIch(1:45), 'ro')
% xlabel('Gate voltage (V)')
% ylabel('Channel current')
% title('Gate characteristics')
% legend('Measured gate voltage (V)')
% 
% subplot(1,2,2)
% semilogy(exp1pMOSVg, exp1pMOSIch, 'bo')
% xlabel('Gate voltage (V)')
% ylabel('Channel current')
% title('Gate characteristics')
% legend('Measured gate voltage (V)')

%incremental transconductance gain
%nMOS

% Isrow = [Is, Is, Is]
% Height = [10^(-8), 10^(-6), 10^(-2)]
% rawgmnMOS = diff(IchnMOS)./diff(VgnMOS);
% gmnMOS = kappan.*(IchnMOS)./Ut
% loglog(abs(IchnMOS(15:70)), abs(rawgmnMOS(14:69)), 'ro')
% hold on
% loglog(Isrow, Height)
% % hold on
% weakNgm = kappa.*(IchnMOS./Ut)
% loglog(abs(IchnMOS(15:70)), abs(weakNgm(15:70)), 'k' )
% hold on
% strongNgm = kappa.*(sqrt(Is.*IchnMOS)./Ut)
% loglog(abs(IchnMOS(15:70)), abs(strongNgm(15:70)), 'm')
% xlabel('Channel current')
% ylabel('Incremental transconductance gain (mho)')
% title('Transconductance gain of an nMOS transistor')
% legend('Measured data',  'Weak inversion theoretical fit', 'Strong inversion theoretical fit')

%incremental transconductance gain 
% %pMOS
% Isprow = [Isp, Isp, Isp]
% Heightp = [10^(-8), 10^(-6), 10^(-2)]
% rawgmpMOS = diff(IchP)./diff(VgP);
% gmpMOS = kappap.*(IchP)./Ut
% loglog(abs(IchP(1:118)), abs(rawgmpMOS), 'ro')
% hold on
% %loglog(Isprow, Heightp)
% % hold on
% weakPgm = kappap.*(IchP./Ut)
% loglog(abs(IchP), abs(weakPgm), 'k' )
% hold on
% strongPgm = kappap.*(sqrt(Isp.*IchP)./Ut)
% loglog(abs(IchP), abs(strongPgm), 'm')
% xlabel('Channel current')
% ylabel('Incremental transconductance gain (mho)')
% title('Transconductance gain of a pMOS transistor')
% legend('Measured data', 'Weak inversion theoretical fit', 'Strong inversion theoretical fit')

%% Source characteristics
% 
% load exp2nMOSIch.csv
% load exp2nMOSVs.csv
% load exp2pMOSIch.csv
% load exp2pMOSVs.csv

%source voltage vs current, with theoretical fit on weak inversion 
% x = abs(exp2nMOSVs);
% y = abs(exp2nMOSIch);
% semilogy(x, y, 'k*');
% xlabel('Source voltage (V)');
% ylabel('Channel current (A)');
% hold on
% semilogy(abs(exp2pMOSVs), abs(exp2pMOSIch), 'ro')
% xlabel('Source voltage (V)')
% ylabel('Channel current (A)')

%incremental source conductance 
%nMOS

% Isrow = [Is, Is, Is]
% Height = [10^(-8), 10^(-6), 10^(-2)]
% rawgsnMOS = diff(exp2nMOSIch)./diff(exp2nMOSVs);
% gsnMOS = (exp2nMOSIch)./Ut
% loglog(abs(exp2nMOSIch(2:140)), abs(rawgsnMOS(1:139)), 'ro')
% % hold on
% % loglog(Isrow, Height)
% hold on
% weakNgs = (exp2nMOSIch./Ut)
% loglog(abs(exp2nMOSIch(2:140)), abs(weakNgs(1:139)), 'k' )
% hold on
% strongNgs = (sqrt(Is.*exp2nMOSIch)./Ut)
% loglog(abs(exp2nMOSIch(2:140)), abs(strongNgs(1:139)), 'm')
% xlabel('Channel current')
% ylabel('Incremental source conductance (mho)')
% title('Incremental source conductance of an nMOS transistor')
% limits = [10^(-9) 10^(-2) 10^(-7) 10^(-2)]
% axis(limits)
% legend('Measured data', 'Weak inversion theoretical fit', 'Strong inversion theoretical fit')

%incremental source conductance 
%pmos

% Ut= 0.025;
% Isrowp = [Isp, Isp, Isp]
% Heightp = [10^(-8), 10^(-6), 10^(-2)]
% rawgspMOS = diff(exp1pMOSIch)./diff(exp2pMOSVs);
% gspMOS = (exp1pMOSIch)./Ut
% loglog(abs(exp1pMOSIch(55:199)), abs(rawgspMOS(55:199)), 'ro')
% hold on
% % loglog(Isprow, Heightp)
% % hold on
% weakPgs = (exp1pMOSIch./Ut)
% loglog(abs(exp1pMOSIch(55:199)), abs(weakPgs(55:199)), 'k' )
% hold on
% strongPgs = (sqrt(Isp.*exp1pMOSIch)./Ut)
% loglog(abs(exp1pMOSIch(55:199)), abs(strongPgs(55:199)), 'm')
% xlabel('Channel current')
% ylabel('Incremental source conductance (mho)')
% title('Incremental source conductance of an pMOS transistor')
% legend('Measured data',  'Weak inversion theoretical fit', 'Strong inversion theoretical fit')
% limits = [10^(-9) 10^(-2) 10^(-7) 10^(-3)]
% axis(limits)