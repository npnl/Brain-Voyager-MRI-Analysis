function[TAL_X, TAL_Y, TAL_Z] = Matlab2Tal(ML_X, ML_Y, ML_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
%  Converts Array Indices when a VTC is read into Matlab to 
%    BrainVoyager QX INTERNAL coordinates.
%  The output are the coordinates of the inner voxel of the 27 
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
TAL_Y = zeros(1,3);
TAL_Y(1,1) = 128 - (X_Start + (ML_X * Resolution_VTC) - 3);
TAL_Y(1,2) = 128 - (X_Start + (ML_X * Resolution_VTC) - 2);
TAL_Y(1,3) = 128 - (X_Start + (ML_X * Resolution_VTC) - 1);

TAL_Z = zeros(1,3);
TAL_Z(1,1) = 128 - (Y_Start + (ML_Y * Resolution_VTC) - 3);
TAL_Z(1,2) = 128 - (Y_Start + (ML_Y * Resolution_VTC) - 2);
TAL_Z(1,3) = 128 - (Y_Start + (ML_Y * Resolution_VTC) - 1);

TAL_X = zeros(1,3);
TAL_X(1,1) = 128 - (Z_Start + (ML_Z * Resolution_VTC) - 3);
TAL_X(1,2) = 128 - (Z_Start + (ML_Z * Resolution_VTC) - 2);
TAL_X(1,3) = 128 - (Z_Start + (ML_Z * Resolution_VTC) - 1);

%% Compute all 27 combinations of coordinates
counter = 0;
for i = 1 : 3
    for j = 1 : 3
        for k = 1 : 3
            counter = counter + 1;
            TAL_MATRIX(counter,:) = [TAL_X(1,i), TAL_Y(1,j), TAL_Z(1,k)];
        end
    end 
end
