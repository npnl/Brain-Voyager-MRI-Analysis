Brief documentation of the script collection:

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

2. There are lot of comments in the script, reading them before running should be helpful.