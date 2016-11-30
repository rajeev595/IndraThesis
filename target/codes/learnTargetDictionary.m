% This function performs K-SVD on the patches and saves dictionary files
% Input: Edata, iter, dictSize are all input parameters to K-SVD
%        PathToPatches -- Path to all the extracted patches
%        PathToDict ----- Path to save the computed dictionary fiels
%        noImages ------- no. of images in the corresponding distiortion
% Output: N/A

function learnTargetDictionary(Edata,iter,dictSize,PathToPatches,PathToDict,noImages)        
% for parallel processing
    %parpool(4)
    
    parfor i = 1 : noImages    
        f = sprintf('Patches_img%d.mat',i); % Name of the Patch             
        f = strcat(PathToPatches,f);        % Adding the path to the patch    
        data = parLoad(f);                     % Loading the patch
        Xt = data.Xt;                          % Patches
        parClear(data);
        params = getParams(Xt,Edata,iter,1,dictSize);   % Modifying the dictionary size    
        [Dict,Coeff] = ksvd(params);      % Obtaining the dictionary    
        f = sprintf('Dict_img%d.mat',i);         % Name of the dictionary
        f = strcat(PathToDict,f);             % Adding the path to dictionary
        parSave(f,Dict,Coeff,Edata,iter);    % Saving the dictionary
    end
end