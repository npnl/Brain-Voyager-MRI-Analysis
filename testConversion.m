function[CMP] = testConversion(BVsys_X, BVsys_Y, BVsys_Z)

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

CMP.SaveAs(ExportFileName);