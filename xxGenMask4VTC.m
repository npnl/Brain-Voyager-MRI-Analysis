function ROImask = xxGenMask4VTC(sub,voi,roi,vtc_dim)

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






    


