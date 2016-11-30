function Xs = getSourcePatches(w,noSrcPatches,entropy_thresh)

    pathToData = '../data/';        % Path to the data directory
    files = dir('../data/img*');    % reading the images
    noFiles = size(files);          % no. of files
    
    Xs = [];        % Initializing the source data to empty matrix

    for i = 1 : noFiles    
        f = files(i,1).name;        % reading ith image from the data        
        f = strcat(pathToData,f);   % Adding the image path
        I = imread(f);              % Reading the image        
        if(size(I, 3) ~= 1)         % Converting a color image to grayscale
            I = rgb2gray(I);
        end
        
        % Re-sizing the image
        %F = max(1, round(length(I)/256));
        %I = imresize(I,1/F);           
        
        P = getPatchesDict(I, w, entropy_thresh);   % Extracting random patches
        noPatches = size(P, 2);                     % no. of patches
        
    % Selecting the patches randomly
        if (noPatches < noSrcPatches)
            patchInds = randsample(noPatches, noPatches);
        else
            patchInds = randsample(noPatches, noSrcPatches);
        end        
        
        P = im2double(P);           % Converting to double               
        Xs = [Xs P(:,patchInds)];  % Adding the patches of each image to source data
    end
end