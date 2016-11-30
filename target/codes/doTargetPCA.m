% This function performs and saves PCA for the extracted patches
% Input: PathToPatches --- Path to all the extracted patches
%        PathToPCA ------- Path to save all the PCA files
%        noImages -------- no. of images in the corresponding distortion
% Output: N/A

function doTargetPCA(PathToPatches,PathToPCA,noImages)   
    for i = 1 : noImages        
        f = sprintf('Patches_img%d.mat',i);     % Extracting the name of the patch    
        f = strcat(PathToPatches, f);           % Adding the path to the patch    
        load(f);                                % Loading the patch    
        [t_coeff,~,~,~,t_explained] = pca(Xt'); % Performing PCA
    % Saving the PCA
        f = sprintf('PCA_img%d.mat',i);       
        f = strcat(PathToPCA,f);
        save(f,'t_coeff','t_explained');
    % Clearing the coefficients for next image
        clear t_coeff
        clear t_explained
    end
end