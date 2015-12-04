function[BV_INT_X, BV_INT_Y, BV_INT_Z] = Matlab2BVint1(ML_X, ML_Y, ML_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
%  Converts Array Indices when a VTC is read into Matlab to 
%    BrainVoyager QX INTERNAL coordinates.
%  The output represents the coordinates of the inner voxel of the 27 
%   voxels. 
%
%  Comments: m.b.schippers@med.umcg.nl

%% BrainVoyager Initialisations
X_Start = 57; 
Y_Start = 52; 
Z_Start = 59; 

Resolution_VTC = 3;

%% Compute the coordinates
BV_INT_X = X_Start + (ML_X * Resolution_VTC) - 2;
BV_INT_Y = Y_Start + (ML_Y * Resolution_VTC) - 2;
BV_INT_Z = Z_Start + (ML_Z * Resolution_VTC) - 2;
