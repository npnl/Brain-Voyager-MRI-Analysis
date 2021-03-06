MatlabScript4BrainVoyager/BVint2Matlab.m                                                            0000700 0001760 0001001 00000001117 10604256700 017521  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[ML_X, ML_Y, ML_Z] = BVint2Matlab(BV_INT_X, BV_INT_Y, BV_INT_Z)

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
ML_Z = ceil((BV_INT_Z - Z_Start + 2)/Resolution_VTC);                                                                                                                                                                                                                                                                                                                                                                                                                                                 MatlabScript4BrainVoyager/BVint2Tal.m                                                               0000700 0001760 0001001 00000001102 10604256706 017041  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[TAL_X, TAL_Y, TAL_Z] = BVint2Tal(BV_INT_X, BV_INT_Y, BV_INT_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
% Converts BrainVoyager QX INTERNAL coordinates to 
%   Talairach coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% Convert BV_INT to BV_SYS
%  The same can be achieved by:
%    [BV_SYS_X, BV_SYS_Y, BV_SYS_Z] = BVint2BVsys(BV_INT_X, BV_INT_Y, BV_INT_Z);
BV_SYS_X = BV_INT_Z;
BV_SYS_Y = BV_INT_X;
BV_SYS_Z = BV_INT_Y;

%% Calculate the coordinates
TAL_X = 128 - BV_SYS_X;
TAL_Y = 128 - BV_SYS_Y;
TAL_Z = 128 - BV_SYS_Z;                                                                                                                                                                                                                                                                                                                                                                                                                                                              MatlabScript4BrainVoyager/BVsys2BVint.m                                                             0000700 0001760 0001001 00000000610 10604256724 017372  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[BV_INT_X, BV_INT_Y, BV_INT_Z] = BVsys2BVint(BV_SYS_X, BV_SYS_Y, BV_SYS_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
%  Converts BrainVoyager QX SYSTEM coordinates to 
%   BrainVoyager QX INTERNAL coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% 'Calculate' the coordinates
BV_INT_X = BV_SYS_Y;
BV_INT_Y = BV_SYS_Z;
BV_INT_Z = BV_SYS_X;
                                                                                                                        MatlabScript4BrainVoyager/BVsys2Matlab.m                                                            0000700 0001760 0001001 00000001424 10604267510 017547  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[ML_X, ML_Y, ML_Z] = BVsys2Matlab(BV_SYS_X, BV_SYS_Y, BV_SYS_Z)

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
ML_Z = ceil((BV_INT_Z - Z_Start + 2)/Resolution_VTC);                                                                                                                                                                                                                                            MatlabScript4BrainVoyager/BVsys2Tal.m                                                               0000700 0001760 0001001 00000000563 10604256750 017076  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[TAL_X, TAL_Y, TAL_Z] = BVsys2Tal(BV_SYS_X, BV_SYS_Y, BV_SYS_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
% Converts BrainVoyager QX SYSTEM coordinates to 
%   Talairach coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% Calculate the coordinates
TAL_X = 128 - BV_SYS_X;
TAL_Y = 128 - BV_SYS_Y;
TAL_Z = 128 - BV_SYS_Z;                                                                                                                                             MatlabScript4BrainVoyager/Matlab2BVint.m                                                            0000700 0001760 0001001 00000002445 10604257016 017527  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[BV_INT_MATRIX] = Matlab2BVint(ML_X, ML_Y, ML_Z)

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
                                                                                                                                                                                                                           MatlabScript4BrainVoyager/Matlab2BVint1.m                                                           0000700 0001760 0001001 00000001223 10604257030 017575  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[BV_INT_X, BV_INT_Y, BV_INT_Z] = Matlab2BVint1(ML_X, ML_Y, ML_Z)

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
                                                                                                                                                                                                                                                                                                                                                                             MatlabScript4BrainVoyager/Matlab2BVsys.m                                                            0000700 0001760 0001001 00000002634 10604257040 017550  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[BV_SYS_MATRIX] = Matlab2BVsys(ML_X, ML_Y, ML_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
%  Converts Array Indices when a VTC is read into Matlab to 
%    BrainVoyager QX SYSTEM coordinates.
%  The output is a matrix in which each row represents a coordinate of a
%  voxel
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
BV_SYS_X = zeros(1,3);
BV_SYS_X(1,1) = Z_Start + (ML_Z * Resolution_VTC) - 3;
BV_SYS_X(1,2) = Z_Start + (ML_Z * Resolution_VTC) - 2;
BV_SYS_X(1,3) = Z_Start + (ML_Z * Resolution_VTC) - 1;

BV_SYS_Y = zeros(1,3);
BV_SYS_Y(1,1) = X_Start + (ML_X * Resolution_VTC) - 3;
BV_SYS_Y(1,2) = X_Start + (ML_X * Resolution_VTC) - 2;
BV_SYS_Y(1,3) = X_Start + (ML_X * Resolution_VTC) - 1;

BV_SYS_Z = zeros(1,3);
BV_SYS_Z(1,1) = Y_Start + (ML_Y * Resolution_VTC) - 3;
BV_SYS_Z(1,2) = Y_Start + (ML_Y * Resolution_VTC) - 2;
BV_SYS_Z(1,3) = Y_Start + (ML_Y * Resolution_VTC) - 1;

%% Compute all 27 combinations of coordinates
counter = 0;
for i = 1 : 3
    for j = 1 : 3
        for k = 1 : 3
            counter = counter + 1;
            BV_SYS_MATRIX(counter,:) = [BV_SYS_X(1,i), BV_SYS_Y(1,j), BV_SYS_Z(1,k)];
        end
    end 
end
                                                                                                    MatlabScript4BrainVoyager/Matlab2BVsys1.m                                                           0000700 0001760 0001001 00000001411 10604257054 017626  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[BV_SYS_X, BV_SYS_Y, BV_SYS_Z] = Matlab2BVsys1(ML_X, ML_Y, ML_Z)

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
BV_SYS_Z = Y_Start + (ML_Y * Resolution_VTC) - 2;                                                                                                                                                                                                                                                       MatlabScript4BrainVoyager/Matlab2Tal.m                                                              0000700 0001760 0001001 00000002675 10604257070 017232  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[TAL_X, TAL_Y, TAL_Z] = Matlab2Tal(ML_X, ML_Y, ML_Z)

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
                                                                   MatlabScript4BrainVoyager/Matlab2Tal1.m                                                             0000700 0001760 0001001 00000001427 10604257110 017300  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[TAL_X, TAL_Y, TAL_Z] = Matlab2Tal1(ML_X, ML_Y, ML_Z)

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
TAL_X = 128 - (Z_Start + (ML_Z * Resolution_VTC) - 2);                                                                                                                                                                                                                                         MatlabScript4BrainVoyager/Readme.txt                                                                0000700 0001760 0001001 00000002420 11601023447 017050  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   Brief documentation of the script collection:

Here is a collection of matlab script if you want to use matlab to analysis fMRI data in BrainVoyager,
instead of endless button clicking in BV's native GUI.

most of the function name as xx*.m (create by Xiaokun Xu, xiaokunx@usc.edu) relied on the Matlab Toolbox for BrainVoyager,
which could be download at http://support.brainvoyager.com/available-tools/52-matlab-tools-bvxqtools.html

Those xxx2xxx.m files do coordinate transformation between Talaraich and BV's native space, remember to check your VTC's 
resolution (in unit of mm) and change the parameters accordingly in those files.

Xiangrui Li xiangrul@usc.edu (used to be here USC) contribute this batch file BV_bat.m, which did fMRI preprocessing in Matlab.

Tips/Disclaimer: 

1. The BV toolbox did not relied on the BVQX programes. You don't need the BVQX be opened and running while you using those scripts.
   Saving for limited licenses we have here in USC is always appreciated by other users.
   
2. Keep backing up your data. BVQX toolbox give you ability to read, modify an write all types of file that BV use.
   You don't want to mis-modify or delete your files.

2. There are lot of comments in the script, reading them before running should be helpful.                                                                                                                                                                                                                                                MatlabScript4BrainVoyager/Tal2BVint.m                                                               0000700 0001760 0001001 00000001103 10604257130 017032  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[BV_INT_X, BV_INT_Y, BV_INT_Z] = Tal2BVint(TAL_X, TAL_Y, TAL_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
% Converts Talairach coordinates to 
%   BrainVoyager QX INTERNAL coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% Calculate the coordinates
BV_SYS_X = 128 - TAL_X;
BV_SYS_Y = 128 - TAL_Y;
BV_SYS_Z = 128 - TAL_Z;

%% Convert BV_SYS to BV_INT
%  The same can be achieved by: 
%    [BV_INT_X, BV_INT_Y, BV_INT_Z] = BVsys2BVint(BV_SYS_X, BV_SYS_Y, BV_SYS_Z);
BV_INT_X = BV_SYS_Y;
BV_INT_Y = BV_SYS_Z;
BV_INT_Z = BV_SYS_X;                                                                                                                                                                                                                                                                                                                                                                                                                                                             MatlabScript4BrainVoyager/Tal2BVsys.m                                                               0000700 0001760 0001001 00000000563 10604257144 017074  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[BV_SYS_X, BV_SYS_Y, BV_SYS_Z] = Tal2BVsys(TAL_X, TAL_Y, TAL_Z)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  February 19, 2007
%
% Converts Talairach coordinates to 
%   BrainVoyager QX SYSTEM coordinates.
%
%  Comments: m.b.schippers@med.umcg.nl

%% Calculate the coordinates
BV_SYS_X = 128 - TAL_X;
BV_SYS_Y = 128 - TAL_Y;
BV_SYS_Z = 128 - TAL_Z;                                                                                                                                             MatlabScript4BrainVoyager/Tal2Matlab.m                                                              0000700 0001760 0001001 00000001467 10604257136 017233  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[ML_X, ML_Y, ML_Z] = Tal2Matlab(TAL_X, TAL_Y, TAL_Z)

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
ML_Z = ceil((BV_INT_Z - Z_Start + 2)/Resolution_VTC);                                                                                                                                                                                                         MatlabScript4BrainVoyager/design2bvprt.m                                                            0000700 0001760 0001001 00000004243 10416613414 017710  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function design2bvprt(design_in, design_out)
%function design2bvprt(design_in, prt_out)
% make protocol file from a 'design' file

% parameters for this experiments:
event = {'fixation', 'left', 'right'}; % for event labels 1, 2, 3, ...
color = {[195 195 195], [75 255 165], [40 150 255]};
TRperTrial = 2;
Pre_event_idx = 1; % 'Baseline/fixation' event before the actual experiment; indexed into event
Pre_event_nTR = 0; % count after the skipped volumes
Post_event_idx = 1;
Post_event_nTR = 12;

%% Don't touch anything below this line!!
if exist('design_out', 'var')
   fout = fopen(design_out,'w');
else
   fout = 1;
end

design = load(design_in);
design = design(:);
ncond = length(event);
if min(design) ~=1 | max(design) ~= ncond
   error('Event numbering in the design file is inconsist with event specification in this .m file');
end

fprintf(fout, '\n');
fprintf(fout, 'FileVersion:        2\n');
fprintf(fout, '\n');
fprintf(fout, 'ResolutionOfTime:   Volumes\n');
fprintf(fout, '\n');
fprintf(fout, 'Experiment:         %s\n',design_in);
fprintf(fout, '\n');
fprintf(fout, 'BackgroundColor:    0 0 0\n');
fprintf(fout, 'TextColor:          255 255 255\n');
fprintf(fout, 'TimeCourseColor:    255 255 255\n');
fprintf(fout, 'TimeCourseThick:    3\n');
fprintf(fout, 'ReferenceFuncColor: 0 0 80\n');
fprintf(fout, 'ReferenceFuncThick: 3\n');
fprintf(fout, '\n');
fprintf(fout, 'NrOfConditions:  %d\n',ncond);
fprintf(fout, '\n');

for i=1:ncond
   j = find(design == i);
   fprintf(fout,'%s\n',event{i});
   n = length(j);
   if Pre_event_idx == i & Pre_event_nTR > 0;
      n = n+1;
   end
   if Post_event_idx == i & Post_event_nTR > 0;
      n = n+1;
   end
   fprintf(fout,'%d\n',n);
   if Pre_event_idx == i & Pre_event_nTR > 0;
      fprintf(fout,'%d %d\n', [1 Pre_event_nTR]);
   end
   fprintf(fout,'%d %d\n', [(j(:)'-1)*TRperTrial+1; j(:)'*TRperTrial]+Pre_event_nTR);
   if Post_event_idx == i & Post_event_nTR > 0;
      fprintf(fout,'%d %d\n', [1 Post_event_nTR]+length(design)*TRperTrial+Pre_event_nTR);
   end
   fprintf(fout,'Color: %d %d %d\n', color{i});
   fprintf(fout,'\n');
end

if fout ~= 1
   fclose(fout);
end
                                                                                                                                                                                                                                                                                                                                                             MatlabScript4BrainVoyager/testConversion.m                                                          0000700 0001760 0001001 00000001205 10577606164 020333  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[CMP] = testConversion(BVsys_X, BVsys_Y, BVsys_Z)

% This function creates a CMP-file, called testConversion_BVsysX_BVsysY_BVsysZ.ica.
%  It has a value of 1 on the specified coordinates and a 0 in 
%  the rest of the matrix

ExportFileName = strcat('testConversion_',num2str(BVsys_X),'_',num2str(BVsys_Y),'_',num2str(BVsys_Z),'.ica');
tmpstr = sprintf('Now calculating: %s', ExportFileName); disp(tmpstr);

[ML_X ML_Y ML_Z] = BVsys2Matlab(BVsys_X, BVsys_Y, BVsys_Z);

CMP = BVQXfile('cmp');
CMP.Component.CMPData(ML_X, ML_Y, ML_Z) = 1;
CMP.Component.LowerThreshold = 0.9;
CMP.Component.UpperThreshold = 1.1;

CMP.SaveAs(ExportFileName);                                                                                                                                                                                                                                                                                                                                                                                           MatlabScript4BrainVoyager/xxGenMask4VTC.m                                                           0000700 0001760 0001001 00000003152 11601015661 017640  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function ROImask = xxGenMask4VTC(sub,voi,roi,vtc_dim)

%% ROImask = xxGenMask4VTC(sub,voi,roi,vtc_dim)
%% Get Voi files, transform the tal coordinates of ROI voxels into BV
%% system coordinates, the transformation will be multiple-to-one (given
%% different resolution in tal and fMRI), after the redandunt/overlapped voxel was
%% eliminated, index to those non-overlapping voxel in vtc space will be used to
%% finally generating a 3-D binary mask.

% required functions:  BVQX toolbox, tested on version 7.2
%                      Tal2Matlab


fMRIroot = 'C:/fMRI/RotvsExp/ImageData/';
voifname = fullfile(fMRIroot,sub,'ROI',voi);
disp(sprintf('Processing Subject %s...',sub));
voifile = BVQXfile(voifname);

num_roi = voifile.NrOfVOIs;
idx_roi = 1;
while ~strcmp(roi,voifile.VOI(idx_roi).Name)
    idx_roi = idx_roi+1; 
    if idx_roi > num_roi
        error(sprintf('no such ROI in subject %s VOI files!',sub));
        
    end
end
tal_roi=voifile.VOI(idx_roi).Voxels;
tal_num_voxel=voifile.VOI(idx_roi).NrOfVoxels;
BV_roi = zeros(tal_num_voxel,3);


for i= 1:tal_num_voxel
    [x y z]=Tal2Matlab(tal_roi(i,1),tal_roi(i,2),tal_roi(i,3));
    BV_roi(i,:) = [x y z];    
end

BV_roi = unique(BV_roi,'rows');
BV_num_voxel = size(BV_roi,1);

ROImask = false(vtc_dim);
for i = 1:BV_num_voxel
    ROImask(BV_roi(i,1),BV_roi(i,2),BV_roi(i,3))=true;
end
  %  we want to tranfer/rotate the vtc coordinate it into normal axial
  % struncture, which means tansfer the [a-p t-b r-l] in vtc to
  % [a-p l-r t-b] order
ROImask = flipdim(permute(ROImask,[1 3 2]),2);
disp('end');






    


                                                                                                                                                                                                                                                                                                                                                                                                                      MatlabScript4BrainVoyager/xxMVPA_Tal2Matlab.m                                                       0000700 0001760 0001001 00000001025 11466110424 020417  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function[vtc_xyz_mat] = xxMVPA_Tal2Matlab(tal_xyz_mat, vtcres)

%% Marleen Schippers & Luca Nanetti & Leonardo Cerliani
%  Feburary 19, 2007
%
%  Converts Talairach coordinates to 
%   Array Indices when a VTC is read into Matlab
%
%  Comments: m.b.schippers@med.umcg.nl

%% BrainVoyager QX Initialisations

start_xyz = ones(size(tal_xyz_mat,1),1) * [57 52 59];

bv_sys_xyz = 128 - tal_xyz_mat;

bv_int_xyz = bv_sys_xyz(:,[2,3,1]);

vtc_xyz_mat = floor((bv_int_xyz - start_xyz)/vtcres)+1;

vtc_xyz_mat = unique(vtc_xyz_mat,'rows');

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           MatlabScript4BrainVoyager/xxMakeMdmfiles.m                                                          0000700 0001760 0001001 00000002570 11367403043 020217  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function xxMakeMdmfiles

sub = ({'CY','DN','JK','JS','KT','ML','OA','XX'});
root = 'C:/fMRI/RotvsExp/ImageData/';
for i = 1:size(sub,2)
    subfolder = fullfile(root,sub{i});
%     log2bvprt(sub{i},4,4);
    cd(root);
    newmdm = BVQXfile('new:mdm');
    newmdm.NrOfStudies = 4;
    
    for run = 1:4
        subrunfolder = fullfile(subfolder, sprintf('Run%d',run));
        tempvtc = dir(fullfile(subrunfolder,'*.vtc'));
        newmdm.XTC_RTC{run,1}= fullfile(subrunfolder,tempvtc(1).name);
        
        temprt = dir(fullfile(subrunfolder,'*RotExpressSimCoding*.prt'));
        xxMakeSdmfiles(sprintf('%s_Run%d_RotExpressSimCoding.sdm',sub{i},run),fullfile(subrunfolder,temprt(1).name),subrunfolder);
        
        tempsdm = dir(fullfile(subrunfolder,'*RotExpressSimCoding*.sdm'));
        newmdm.XTC_RTC{run,2}= fullfile(subrunfolder,tempsdm.name);
        
        if run == 1
            run1vtc = BVQXfile(fullfile(subrunfolder,tempvtc(1).name));
            tempprt = dir(fullfile(subrunfolder,'*RotExpressSimCoding*.prt'));
            run1vtc.NameOfLinkedPRT = fullfile(subrunfolder,tempprt.name);
            run1vtc.Save;
            run1vtc.ClearObject;
        end
    end
    
    newmdm.SaveAS(fullfile(subfolder,'MDM',sprintf('%s_Exp4Runs_RotExpressSimCoding.mdm',sub{i})));
    newmdm.ClearObject;
    BVQXfile(0,'ClearAllObjects');
end

                                                                                                                                        MatlabScript4BrainVoyager/xxMakeSdmfiles.m                                                          0000700 0001760 0001001 00000002753 11550666636 020245  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function xxMakeSdmfiles(sdmfilename,prtfilename,dest_path)

%% read prt file, creat a sdm file using 10 bins for each condition,
%% in a deconvolution design matrix

tempprt = BVQXfile(prtfilename);
newsdm = BVQXfile('new:sdm');

newsdm.NrOfPredictors = 10* (tempprt.NrOfConditions - 1) +1;
newsdm.NrOfDataPoints = 221;
newsdm.SDMMatrix = zeros(newsdm.NrOfDataPoints, newsdm.NrOfPredictors);
newsdm.FirstConfoundPredictor = newsdm.NrOfPredictors;
newsdm.PredictorColors = zeros(newsdm.NrOfPredictors,3);

%% Define the condition color using the info from associated prt file

for i = 1:(tempprt.NrOfConditions-1)
    newsdm.PredictorColors(((i-1)*10+1):i*10,:) = ones(10,1) * tempprt.Cond(i+1).Color;
    for bin = 1:10
        newsdm.PredictorNames{1,10*(i-1)+bin} = sprintf('%s_D%d',cell2mat(tempprt.Cond(i+1).ConditionName),bin-1);
        
        tempcol = zeros(newsdm.NrOfDataPoints,1);
        
        tempOnsetIdx = int16(tempprt.Cond(i+1).OnOffsets(:,1) + bin - 1);
        
        tempOnsetIdx(find(tempOnsetIdx>newsdm.NrOfDataPoints)) = [];
       
        tempcol(tempOnsetIdx)= 1;
        
        newsdm.SDMMatrix(:,10*(i-1)+bin) = tempcol;
    end        
end


newsdm.SDMMatrix(:,newsdm.NrOfPredictors)= ones(newsdm.NrOfDataPoints,1);
newsdm.PredictorNames{newsdm.NrOfPredictors} = 'Constant';
newsdm.PredictorColors(newsdm.NrOfPredictors,:) = [255 255 255];

tempprt.ClearObject;
newsdm.SaveAs(fullfile(dest_path,sdmfilename));
newsdm.ClearObject;



                     MatlabScript4BrainVoyager/xxMotionCorrect_plot.m                                                    0000700 0001760 0001001 00000004272 11601016104 021474  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function xxMotionCorrect_plot(Subj,folder,type)

%% xxMotionCorrect_plot(Subj,folder,type)
% xxMotionCorrect_plot(Subj,folder,type) Plot the head movement 
% including: Translate X,Y,Z in mm and Rotation x,y,z in degree).
% the figure will plot all runs in the folder.
% type 1 will plot the raw data, type 2 will take out the between-run
% movement such tha the 6 paras in first TR of each run will be zero.

mycolor =[255 0 0;0 255 0;0 0 255; 0 128 128; 128 0 128; 128 128 0]/255;
h =figure();
set(gcf,'MenuBar','none');
%Title('3d Motion Correction');
SubjPath = fullfile('C:\fMRI\MJH\', Subj);
MCfile = dir(fullfile(SubjPath,folder,'\*_3DMC.sdm'));
N_Run = size(MCfile,1);
subaxesh= mlTileAxes(ceil(sqrt(N_Run)),ceil(sqrt(N_Run)));

for i_run = 1:N_Run
    
   
    f3dmc_name = fullfile(SubjPath,folder,MCfile(i_run).name);
    fid = fopen(f3dmc_name,'r');
    
    while ~strcmp(fgetl(fid),'NrOfPredictors:          6')
    end
    aa = regexp(fgetl(fid),'(?<=NrOfDataPoints:          )[0-9]*','match');
    N_TR = str2num(aa{1});
    % in BV new version >=1.10.4, 3d motion correction generate *_3DMC.sdm
    while ~strcmp(fgetl(fid),'"Translation BV-X [mm]" "Translation BV-Y [mm]" "Translation BV-Z [mm]" "Rotation BV-X [deg]" "Rotation BV-Y [deg]" "Rotation BV-Z [deg]"')
    % in old version, the mc parameter stored in *3DMC.rtc    
    %while ~strcmp(fgetl(fid),'"X translation [mm]" "Y translation [mm]" "Z translation [mm]" "X rotation [deg]" "Y rotation [deg]" "Z rotation [deg]"')
    end
    MC_mat = fscanf(fid,'%g %g %g %g %g %g',[6,N_TR])';
    fclose(fid);
    
    axes('OuterPosition',subaxesh(i_run,:));
    
    if type == 1
        plot(MC_mat,'Linewidth',2);
    elseif type ==2
        plot(MC_mat-ones(N_TR,1)*MC_mat(1,:),'Linewidth',2);
    end
    
    set(gca,'ColorOrder',mycolor,'ylim',[-1 1],'XTick',0:20:200);
%     if i_run == 1;
% %         set(gca,'XLim',[0 N_TR],'YLim',[-1,1]);
%          legend({'Xtrans','Ytrans','Ztrans','Xrotate','Yrotate','Zrotate'},'Orientation','horizontal');%,'Location','NorthEast');
%     end
    
    title(sprintf('%s Run %d',Subj,i_run));
    %title( [Subj,'_',Session,num2str(i_run)]);

end



  

                                                                                                                                                                                                                                                                                                                                          MatlabScript4BrainVoyager/xxRoiDeconv.m                                                             0000700 0001760 0001001 00000006002 11601016524 017536  0                                                                                                    ustar   Xiaokun                         None                                                                                                                                                                                                                   function [PSCMat] = xxRoiDeconv(sub,voi,roi,mdm)

%% [PSCMat] = xxRoiDeconv(sub,voi,roi,mdm), PSCMat is the percent signal change, required
%% inputs: sub initial, voi file name, roi the name of ROI in voi file, and part
%% of the mdm file name;
%% Required m-file: Tal2Matlab.m, BVQXfile toolbox version 7.2(tested).

%% Get Voi files, transform the tal coordinates of ROI voxels into BV
%% system coordinates, the transformation will be multiple-to-one (given
%% different resolution in tal and fMRI), after the redandunt/overlapped voxels being
%% eliminated, the unique fMRI-space coordinates will be used as index to tract the
%% voxel's timecourse stored in VTC files

%% 
fMRIroot = 'C:/fMRI/RotvsExp/ImageData/';
voifname = fullfile(fMRIroot,sub,'ROI',voi);
fprintf('Processing Subject %s...',sub);
voifile = BVQXfile(voifname);

num_roi = voifile.NrOfVOIs;
idx_roi = 1;
while ~strcmp(roi,voifile.VOI(idx_roi).Name)
    idx_roi = idx_roi+1; 
    if idx_roi > num_roi
        error(sprintf('no such ROI in subject %s VOI files!',sub));
        
    end
end
tal_roi=voifile.VOI(idx_roi).Voxels;
tal_num_voxel=voifile.VOI(idx_roi).NrOfVoxels;
BV_roi = zeros(tal_num_voxel,3);


for i= 1:tal_num_voxel
    [x y z]=Tal2Matlab(tal_roi(i,1),tal_roi(i,2),tal_roi(i,3));
    BV_roi(i,:) = [x y z];    
end

BV_roi = unique(BV_roi,'rows');
BV_num_voxel = size(BV_roi,1);

%% Read MDM files, which contain the VTC file names and design matrix,
%% Next, concatinate the VTC time course, do the average, result in a
%% single time course vector Y;
%% Thirdly, concatinate sdm design matrices into a single matrix X

mdmfname = fullfile(fMRIroot,sub,'MDM',sprintf('%s_Exp4Runs_%sCoding.mdm',sub,mdm));

mdmfile = BVQXfile(mdmfname);

n_run = mdmfile.NrOfStudies;

Y=[];
X=[];
XConst=[];

for i = 1:n_run;
    tempVTC = BVQXfile(mdmfile.XTC_RTC{i,1});
    tempSDM = BVQXfile(mdmfile.XTC_RTC{i,2});
    
    nTRperRun = size(tempVTC.VTCData,1);
  
    for i_vox = 1: BV_num_voxel
        tempRunTC(:,i_vox)= tempVTC.VTCData(:,BV_roi(i_vox,1),BV_roi(i_vox,2),BV_roi(i_vox,3));
    end

    tempRunmeanTC = mean(tempRunTC,2);
    Y = [Y;tempRunmeanTC];
    tempVTC.ClearObject;
    
    tempRunX = tempSDM.SDMMatrix(:,1:end-1);
    X = cat(1,X,tempRunX);
    tempRunConst = zeros(nTRperRun*n_run,1);
    tempRunConst((i*nTRperRun-nTRperRun+1): (i*nTRperRun))=1;
    XConst = [XConst,tempRunConst];
    tempSDM.ClearObject;
end

voifile.clearObject;
mdmfile.clearObject;

X = [X XConst];

% there might be other optimized way to run the glm regression. Here I
% trust the matlab native function regress, Mark also suggest regstats
[Betas,bint,resids,rint,RegStats] = regress(Y,X);

% Percent Signal Change.
PSCMat = reshape(Betas(1:100),10,10) ./(mean(Betas(end-n_run+1:end))/100);
    
figure;
plot(PSCMat(:,1:5),'LineWidth',2);legend({'Same','D_Express','D_View','D_E+V','D_E+V+P'});
ylabel('Percent Signal Change'); title('BOLD Response with View/Expression/Person Change');


    


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              