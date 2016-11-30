% This function extracts and saves all the patches for the given images
% Input: w - patch size
%            noTrgPatches ---- no. of target patches to be extracted,
%            entropy_thresh -- minimum threshold to consider a patch
%            PathToImgs ----- Path to all the images
%            PathToPatches -- Path to save all the extracted patches
%            noImages ------- no. of images in the corresponding distortion
% Output: N/A

function getTargetPatches(w,noTrgPatches,entropy_thresh,PathToImgs,PathToPatches,noImages)
    
    for i = 1 : noImages
        Xt = [];                                % Initializing the target data to empty matrix
        f = sprintf('img%d.bmp',i);             % Reading the image name
        f = strcat(PathToImgs,f);               % Adding path of image to name   
        I = imread(f);                          % Reading the image   
        I = rgb2gray(I);                        % Converting the Color image to Grayscale
        
        % Re-sizing the image
        %F = max(1, round(length(I)/256));
        %I = imresize(I,1/F);        
        
        P = getPatchesDict(I,w,entropy_thresh); % Extracting the patches from the image   
        noPatches = size(P,2);                  % Extracting the no of patches    
    % Selecting the patches randomly
        if(noPatches < noTrgPatches)
            patchIndcs = randsample(noPatches,noPatches);
        else
            patchIndcs = randsample(noPatches,noTrgPatches);
        end    
        Xt = [Xt P(:,patchIndcs)];              % Adding the Patches to target data matrix
    % Saving the patches
        f = sprintf('Patches_img%d.mat',i);        
        f = strcat(PathToPatches,f);
        save(f,'Xt');
    end
end