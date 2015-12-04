function xxMakeMdmfiles

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

