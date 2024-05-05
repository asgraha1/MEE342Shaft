clear, clc
%% Properties
D_G2 = 19.5; D_P3 = 4.5; D_G4 = D_G2; D_P5 = D_P3; %Diameters of gears and pinions (inches)
Sut = 68000; %Tensile Strength of 1020 CD Steel (psi)
Sy = 57000; %Yield Strength of 1020 CD Steel (psi)
Se = 34000; %Endurance Limit of 1020 CD Steel (psi) * Assume Se = Se'
%% Input Shaft
% Lengths
L1i = 0.866; L2i = 1.3; L3i = 0.866; L4i = 4;
L1fi = 0.5; L2fi = 0.75; L3fi = 0.25;
LengthISZ = [0; L1i/2; L1i/2; L1i+L1fi+L2i/2; L1i+L1fi+L2i/2; L1i+L1fi+L2i+L2fi+L3i/2; L1i+L1fi+L2i+L2fi+L3i/2; L1i+L1fi+L2i+L2fi+L3i+L3fi+L4i];
LengthISY = [0; L1i/2; L1i/2; L1i+L1fi+L2i/2; L1i+L1fi+L2i/2; L1i+L1fi+L2i+L2fi+L3i/2; L1i+L1fi+L2i+L2fi+L3i/2; L1i+L1fi+L2i+L2fi+L3i+L3fi+L4i; L1i+L1fi+L2i+L2fi+L3i+L3fi+L4i];
LengthIMZ = [0; LengthISY(2); LengthISY(4); LengthISY(6); LengthISY(8)];
LengthIMY = [0; LengthISZ(2); LengthISZ(4); LengthISZ(7); LengthISZ(8)];
LengthIT = [0; LengthISZ(4); LengthISZ(4); LengthISZ(end); LengthISZ(end)];
% Forces 
Wt2 = 47.53; Wr2 = 17.3;
Lat = 260; Tor = 38.6;
Ray = 274.57; Raz = 25.5;
Rby = 517.96; Rbz = 22.023;
ShearFYI = [0; 0; -Ray; -Ray; -Ray-Wr2; -Ray-Wr2; -Ray-Wr2+Rby; -Ray-Wr2+Rby; 0];
ShearFZI = [0; 0; -Raz; -Raz; -Raz+Wt2; -Raz+Wt2; 0; 0];
% Moments/Torques
MomentIZ = [0; 0; -Ray*(LengthISY(4)-LengthISY(3)); -Ray*(LengthISY(4)-LengthISY(3))-Wr2*(LengthISY(6)-LengthISY(5)); 0];
MomentIY = [0; 0; Raz*(LengthISZ(4)-LengthISZ(3)); 0; 0];
TorqueI = [0; 0; -D_G2*Wt2; -D_G2*Wt2; 0];
% Plots
figure(1)
plot(LengthISY,ShearFYI)
figure(2)
plot(LengthISZ, ShearFZI)
figure(3)
plot(LengthIMZ, MomentIZ)
figure(4)
plot(LengthIMY, MomentIY)
figure(5)
plot(LengthIT, TorqueI)
% Diameters and Fillets of Input Shaft
d1i = 2.82; %in
d2i = d1i*1.2; d4i = d2i; %in * fixed ratio between diameters
d3i = d2i*1.2; %in
Rfi = d1/10; %in * fixed ratio between diameters 1-2, 2-3, amd 3-4
%% Intermediate Shaft
% Lengths
L1m = 0.394; L2m = 0.1; L3m = 4; Lf = 0.75;
LengthMS = [0; L1m/2; L1m/2; L1m+Lf+L2m/2; L1m+Lf+L2m/2; L1m+Lf+L2m+L3m+L2m/2; L1m+Lf+L2m+L3m+L2m/2; L1m+Lf+L2m+L3m+L2m+Lf+L1m/2; L1m+Lf+L2m+L3m+L2m+Lf+L1m/2; L1m+Lf+L2m+L3m+L2m+Lf+L1m];
LengthMM = [0; LengthMS(2); LengthMS(4); LengthMS(6); LengthMS(8); LengthMS(10)];
LengthMT = [0; LengthMS(4); LengthMS(4); LengthMS(6); LengthMS(6); LengthMS(end)];
% Forces
Wr3 = 17.3; Wt3 = 47.53; Wr4 = 3.99; Wt4 = 10.97;
Ryc = 15.1224; Ryd = 6.1676; Rzc = 37.5952; Rzd = 1.3992;
ShearFYM = [0; 0; Ryd; Ryd; Ryd-Wr4; Ryd-Wr4; -Ryc; -Ryc; 0; 0];
ShearFZM = [0; 0; Rzd; Rzd; Rzd-Wt4; Rzd-Wt4; Wt3; Wt3; 0; 0];
% Moments/ Torque
MomentMZ = [0; 0; ShearFYM(3)*(LengthMS(4)-LengthMS(3)); ShearFYM(3)*(LengthMS(4)-LengthMS(3))+ShearFYM(5)*(LengthMS(6)-LengthMS(5)); 0; 0];
MomentMY = [0; 0; -ShearFZM(3)*(LengthMS(4)-LengthMS(3)); -ShearFZM(3)*(LengthMS(4)-LengthMS(3))+ShearFZM(5)*(LengthMS(6)-LengthMS(5)); 0; 0];
TorqueM = [0; 0; Wt3*D_P3; Wt3*D_P3; 0; 0];
% Plots
figure(6)
plot(LengthMS, ShearFYM)
figure(7)
plot(LengthMS, ShearFZM)
figure(8)
plot(LengthMM, MomentMZ)
figure(9)
plot(LengthMM, MomentMY)
figure(10)
plot(LengthMT, TorqueM)
% Diameters and Fillets for Intermediate Shaft
dim = 0.45; d5m = d1m; %in * diameter slightly increased for improving fatigue and yielding safety factors
d2m = d1m*1.2; d4m = d2m; %in * fixed ratio between diameters
d3m = d2m*1.2; %in
Rfm1 = d1m/10; %in * fixed ratios between diameters d1 - d2 and d4 - d5
Rfm2 = d2m/10; %in * fixed ratios between diameters d2 - d3 and d3 - d4
%% Output Shaft
% Lengths
L1o = 2; L1fo = 0.25; L2o = 0.43; L2fo = 0.75; L3o = 0.55; L3fo = 0.5; L4o = 0.43;
LengthOS = [0; L1o+L1fo+L2o/2; L1o+L1fo+L2o/2; L1o+L1fo+L2o+L2fo+L3o/2; L1o+L1fo+L2o+L2fo+L3o/2; L1o+L1fo+L2o+L2fo+L3o+L3fo+L4o/2; L1o+L1fo+L2o+L2fo+L3o+L3fo+L4o/2; L1o+L1fo+L2o+L2fo+L3o+L3fo+L4o];
LengthOM = [0; LengthOS(2); LengthOS(4); LengthOS(7); LengthOS(8)];
LengthOT = [0; 0; LengthOS(4); LengthOS(4); LengthOS(end)];
% Forces
Wr5 = 3.99; Wt5 = 10.97;
Rye = 1.995; Ryf = 1.995; Rze = 5.48; Rzf = 5.48;
ShearFYO = [0; 0; Rye; Rye; -Ryf; -Ryf; 0; 0];
ShearFZO = [0; 0; -Rze; -Rze; Rzf; Rzf; 0; 0];
% Moments
MomentOZ = [0; 0; Rye*(LengthOM(4)-LengthOM(3)); 0; 0];
MomentOY = [0; 0; Rze*(LengthOM(4)-LengthOM(3)); 0; 0]; 
TorqueO = [0; D_P5*Wt5; D_P5*Wt5; 0; 0];
% Plots
figure(11)
plot(LengthOS, ShearFYO)
figure(12)
plot(LengthOS, ShearFZO)
figure(13)
plot(LengthOM, MomentOZ)
figure(14)
plot(LengthOM, MomentOY)
figure(15)
plot(LengthOT, TorqueO)
% Diameters and Fillets of Outer Shaft
d2o = 3.33; d4o = d2o; % in
d3o = 3.52; %in
d1o = 3.097; d5o = d1o; %in
Rfo = d1o/10; %in * fixed ratio between diameters d2-d3 and d3-d4