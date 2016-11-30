% This function claculates the Global scores
% Input: PathToPCA ---  Path to all the PCA files
%        PathToDict --  Path to all the dictionary files
%        PathToScores - Path to save the scores
%        noImages ----- no. of images in the corresponding distortion
% Output: N/A

function getGlobalScores(PathToPCA,PathToDict,PathToScores,noImages)
    load('../../source/SourcePCA.mat');         % Loading source PCA
    Ps = s_coeff;                               % Source subspace
    data = load('../../source/SourceDictionary.mat'); % Loading source ditionary
    Ds = data.source_dict;                            % Source Dictionary    

    scores = [];
        
    for i = 1 : noImages;        
        f = strcat(PathToPCA, sprintf('PCA_img%d.mat',i));  % Adding path to pca file name        
        data = load(f);                                     % Loading the target PCA basis
        Pt = data.t_coeff;                                  % Target subspace            
        clear data                                          % Clearing t_coeff for next image        
        M = Pt' * Ps;                                       % Transformation Matrix        
        score = norm(M(:), 1);                              % L1 norm of M
        scorePCA = 100*score/(length(M)^2);                 % Normalizing the score to 100
        
        f = strcat(PathToDict, sprintf('Dict_img%d.mat',i));    % Adding Path To Dictionary File
        data = load(f);                                         % Loading the target dictionary
        Dt = data.dict;                                         % Target dictionary
        M = pinv(Dt)*Ds;                                        % Transformation matrix
        scoreDict = norm(M,'fro');                              % Frobenius norm of M
        scores =[scores; scorePCA scoreDict];                   % Adding the score to matrix        
    end
    f = strcat(PathToScores,'GlobalScores.mat');                % Saving the scores
    save(f,'scores');
end