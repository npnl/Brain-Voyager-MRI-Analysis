function[BV_INT_MATRIX] = Matlab2BVint(ML_X, ML_Y, ML_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
%  Converts Array Indices when a VTC is read into Matlab to 
%    BrainVoyager QX INTERNAL coordinates.
%  The output is a matrix in which each row represents a coordinate of a
%  voxel
%
%  Comments: m.b.schippers@med.umcg.nl

%% BrainVoyager Initialisations
X_Start = 57; 
Y_Start = 52; 
Z_Start = 59; 

Resolution_VTC = 3;

%% Compute the coordinates
BV_INT_X = zeros(1,3);
BV_INT_X(1,1) = X_Start + (ML_X * Resolution_VTC) - 3;
BV_INT_X(1,2) = X_Start + (ML_X * Resolution_VTC) - 2;
BV_INT_X(1,3) = X_Start + (ML_X * Resolution_VTC) - 1;

BV_INT_Y = zeros(1,3);
BV_INT_Y(1,1) = Y_Start + (ML_Y * Resolution_VTC) - 3;
BV_INT_Y(1,2) = Y_Start + (ML_Y * Resolution_VTC) - 2;
BV_INT_Y(1,3) = Y_Start + (ML_Y * Resolution_VTC) - 1;

BV_INT_Z = zeros(1,3);
BV_INT_Z(1,1) = Z_Start + (ML_Z * Resolution_VTC) - 3;
BV_INT_Z(1,2) = Z_Start + (ML_Z * Resolution_VTC) - 2;
BV_INT_Z(1,3) = Z_Start + (ML_Z * Resolution_VTC) - 1;

%% Compute all 27 combinations of coordinates
counter = 0;
for i = 1 : 3
    for j = 1 : 3
        for k = 1 : 3
            counter = counter + 1;
            BV_INT_MATRIX(counter,:) = [BV_INT_X(1,i), BV_INT_Y(1,j), BV_INT_Z(1,k)];
        end
    end 
end
