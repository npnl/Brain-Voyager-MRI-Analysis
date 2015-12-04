function[ML_X, ML_Y, ML_Z] = BVint2Matlab(BV_INT_X, BV_INT_Y, BV_INT_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  Feburary 19, 2007
%
%  Converts BrainVoyager QX INTERNAL coordinates to 
%   Array Indices when a VTC is read into Matlab
%
%  Comments: m.b.schippers@med.umcg.nl

%% BrainVoyager QX Initialisations
X_Start = 57;
Y_Start = 52;
Z_Start = 59;

Resolution_VTC = 3;

%% Calculate the coordinates M&L&L
ML_X = ceil((BV_INT_X - X_Start + 2)/Resolution_VTC);
ML_Y = ceil((BV_INT_Y - Y_Start + 2)/Resolution_VTC);
ML_Z = ceil((BV_INT_Z - Z_Start + 2)/Resolution_VTC);