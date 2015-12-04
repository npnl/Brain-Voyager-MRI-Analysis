function[BV_SYS_X, BV_SYS_Y, BV_SYS_Z] = Matlab2BVsys1(ML_X, ML_Y, ML_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
%  Converts Array Indices when a VTC is read into Matlab to 
%    BrainVoyager QX SYSTEM coordinates.
%  The output represents the coordinates of the inner voxel of the 27 
%   voxels. 
%
%  Comments: m.b.schippers@med.umcg.nl

%% BrainVoyager Initialisations
X_Start = 57; 
Y_Start = 52; 
Z_Start = 59; 

Resolution_VTC = 3;

%% Compute the coordinates & 
%  swap the dimensions according to:
%     BV_SYS_X = BV_INT_Z;
%     BV_SYS_Y = BV_INT_X;
%     BV_SYS_Z = BV_INT_Y;
BV_SYS_X = Z_Start + (ML_Z * Resolution_VTC) - 2;
BV_SYS_Y = X_Start + (ML_X * Resolution_VTC) - 2;
BV_SYS_Z = Y_Start + (ML_Y * Resolution_VTC) - 2;