function xxMotionCorrect_plot(Subj,folder,type)

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



  

    