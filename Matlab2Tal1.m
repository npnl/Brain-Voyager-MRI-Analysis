function[TAL_X, TAL_Y, TAL_Z] = Matlab2Tal1(ML_X, ML_Y, ML_Z)

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

%% Compute the coordinates &
%  swap the dimensions according to:
%     TAL_X = 128 - BV_INT_Z;
%     TAL_Y = 128 - BV_INT_X;
%     TAL_Z = 128 - BV_INT_Y;
TAL_Y = 128 - (X_Start + (ML_X * Resolution_VTC) - 2);
TAL_Z = 128 - (Y_Start + (ML_Y * Resolution_VTC) - 2);
TAL_X = 128 - (Z_Start + (ML_Z * Resolution_VTC) - 2);