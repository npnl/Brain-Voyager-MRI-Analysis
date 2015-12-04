function xxMakeSdmfiles(sdmfilename,prtfilename,dest_path)

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



