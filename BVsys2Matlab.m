function[ML_X, ML_Y, ML_Z] = BVsys2Matlab(BV_SYS_X, BV_SYS_Y, BV_SYS_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  Feburary 19, 2007
%
%  Converts BrainVoyager QX SYSTEM coordinates to 
%   Array Indices when a VTC is read into Matlab
%
%  Comments: m.b.schippers@med.umcg.nl

%% BrainVoyager QX Initialisations
X_Start = 57;
Y_Start = 52;
Z_Start = 59;

Resolution_VTC = 3;

%% Convert BV_SYS to BV_INT
%  The same can be achieved by:
%    [BV_INT_X, BV_INT_Y, BV_INT_Z] = BVsys2BVint(BV_SYS_X, BV_SYS_Y, BV_SYS_Z);
BV_INT_X = BV_SYS_Y;
BV_INT_Y = BV_SYS_Z;
BV_INT_Z = BV_SYS_X;

%% Calculate the coordinates
ML_X = ceil((BV_INT_X - X_Start + 2)/Resolution_VTC);
ML_Y = ceil((BV_INT_Y - Y_Start + 2)/Resolution_VTC);
ML_Z = ceil((BV_INT_Z - Z_Start + 2)/Resolution_VTC);