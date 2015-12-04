function[ML_X, ML_Y, ML_Z] = Tal2Matlab(TAL_X, TAL_Y, TAL_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  Feburary 19, 2007
%
%  Converts Talairach coordinates to 
%   Array Indices when a VTC is read into Matlab
%
%  Comments: m.b.schippers@med.umcg.nl

%% BrainVoyager QX Initialisations
X_Start = 57;
Y_Start = 52;
Z_Start = 59;

Resolution_VTC = 3;

%% Convert TAL to BV_INT
%  The same can be achieved by:
%    [BV_INT_X, BV_INT_Y, BV_INT_Z] = Tal2BVint(TAL_X, TAL_Y, TAL_Z);
BV_SYS_X = 128 - TAL_X;
BV_SYS_Y = 128 - TAL_Y;
BV_SYS_Z = 128 - TAL_Z;

BV_INT_X = BV_SYS_Y;
BV_INT_Y = BV_SYS_Z;
BV_INT_Z = BV_SYS_X;

%% Calculate the coordinates
ML_X = ceil((BV_INT_X - X_Start + 2)/Resolution_VTC);
ML_Y = ceil((BV_INT_Y - Y_Start + 2)/Resolution_VTC);
ML_Z = ceil((BV_INT_Z - Z_Start + 2)/Resolution_VTC);