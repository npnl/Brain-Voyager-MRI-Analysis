function [PSCMat] = xxRoiDeconv(sub,voi,roi,mdm)

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


    


