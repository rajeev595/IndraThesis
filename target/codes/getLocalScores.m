% This function claculates the Local scores
% Input: PathToDict ----  Path to all the dictionary files
%        PathToPatches -- Path to all the extracted patches
%        PathToScores --- Path to save the scores
%        noImages ------- no. of images in the corresponding distortion
% Output: N/A

function getLocalScores(PathToDict,PathToPatches,PathToScores,noImages)
    data = load('../../source/SourceDictionary.mat'); % Loading source ditionary
    Ds = data.source_dict;                            % Source Dictionary

    scores = [];        
    for i = 1 : noImages
        f = strcat(PathToDict, sprintf('Dict_img%d.mat',i));    % Adding path to Dictionary file name                
        data = load(f);                                         % Loading the dictionary
        Dt = data.dict;                                         % Target dictionary
        clear data                                              % Clearing the data  
        M = pinv(Dt)*Ds;                                        % Transformation matrix
        
        f = sprintf('Patches_img%d.mat',i);         % Name of the Patch
        f = strcat(PathToPatches,f);                % Adding the path to the patch    
        data = parLoad(f);                          % Loading the patch
        Xt = data.Xt;                               % Target Patches
        
        alpha = omp(Ds'*Xt,Ds'*Ds,30);                  % Sparse matrix
        scoreL = mean(sum(alpha.*repmat(diag(M'*M)...   % Local score
                      ,1,size(Xt,2)),1)./sum(alpha,1));
        scoreT = norm(M,'fro')*scoreL;                  % Total/overall score        
        scores = [scores; scoreL scoreT];               % adding the score to matrix
    end
    f = strcat(PathToScores,'LocalScores.mat');         % saving the scores
    save(f,'scores');
end