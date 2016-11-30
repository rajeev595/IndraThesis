% This is the main file for the target(LIVE/CSIQ/TID2008)
% This obtains the results for all the datbases as follows:
% 1) Extracts Patches
% 2) Performs PCA and Dictionary Learning
% 3) Obtains global and local quality scores
% 4) Finally, calculates the SROCC values

% Parameters used
    w = 11;
    noTrgPatches = 4000;
    entropy_thresh = 3;
% Dictionary Learning parameters    
    Edata = 0.05;
    iter = 15;
    dictSize = 500;    
    
    mkdir('..','results');  % Directory for results
    
    data = 1;
    mkdir('../results','LIVE'); % Directory for LIVE
    parpool(4)
    for distortion = 1 : 4
        [PathToImgs, PathToPatches, PathToPCA,...               % Obtaining Paths
            PathToScores, PathToDict, noImages] = getPaths(data, distortion);                
        getTargetPatches(w,noTrgPatches,entropy_thresh,...
            PathToImgs,PathToPatches,noImages);                 % Extracting the Target Patches
        doTargetPCA(PathToPatches,PathToPCA,noImages);          % Perform PCA
    
        learnTargetDictionary(Edata,iter,dictSize,PathToPatches,PathToDict,noImages);
        getGlobalScores(PathToPCA,PathToDict,PathToScores,noImages);
        getLocalScores(PathToDict,PathToPatches,PathToScores,noImages);
        spearmanScore(distortion,data,PathToScores);
    end