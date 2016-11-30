% This function gives the paths required to other functins for further processing.
% Input: data --- 1 for LIVE, 2 for CSIQ, 3 for TID2008
%        distortion --- 1 for jp2k, 2 for jpeg, 3 for wn, 4 for gblur         
% Output: PathToImgs ------Path to all the images
%         PathToPatches ---Path to all the patches
%         PathToPCA -------Path to all the PCA files
%         PathToScores ----Path to all Quality/Correlation scores
%         PathToDict ------Path to all the dictionary files
%         noImages --------Number of images in the corresponding distortion

function [PathToImgs, PathToPatches, PathToPCA, PathToScores, PathToDict, noImages] = getPaths(data, distortion)
    if(data == 1)       
        if(distortion == 1)        
            mkdir('../results/LIVE','jp2k');                % Directory for jp2k results
            mkdir('../results/LIVE/jp2k','patches');        % Directory for patches
            mkdir('../results/LIVE/jp2k','PCA');            % Directory for PCA
            mkdir('../results/LIVE/jp2k','Dicts')           % Directory for dictionaries
            
            PathToImgs = '../../Database/LIVE/data/jp2k/';  % path to the images
            PathToPatches = '../results/LIVE/jp2k/patches/';% path to the patches
            PathToPCA = '../results/LIVE/jp2k/PCA/';    % Path to PCA
            PathToScores = '../results/LIVE/jp2k/';         % Path to scores
            PathToDict = '../results/LIVE/jp2k/Dicts/';     % Path to dictionary
            noImages = 227;
        elseif(distortion == 2)        
            mkdir('../results/LIVE','jpeg');                % Directory for jp2k results
            mkdir('../results/LIVE/jpeg','patches');        % Directory for patches
            mkdir('../results/LIVE/jpeg','PCA');            % Directory for PCA
            mkdir('../results/LIVE/jpeg','Dicts')           % Directory for dictionaries
            
            PathToImgs = '../../Database/LIVE/data/jpeg/';  % path to the images
            PathToPatches = '../results/LIVE/jpeg/patches/';% path to the patches
            PathToPCA = '../results/LIVE/jpeg/PCA/';    % Path to PCA
            PathToScores = '../results/LIVE/jpeg/';         % Path to scores
            PathToDict = '../results/LIVE/jpeg/Dicts/';     % Path to dictionary           
            noImages = 233;
        elseif(distortion == 3)        
            mkdir('../results/LIVE','wn');                % Directory for jp2k results
            mkdir('../results/LIVE/wn','patches');        % Directory for patches
            mkdir('../results/LIVE/wn','PCA');            % Directory for PCA
            mkdir('../results/LIVE/wn','Dicts')           % Directory for dictionaries
            
            PathToImgs = '../../Database/LIVE/data/wn/';  % path to the images
            PathToPatches = '../results/LIVE/wn/patches/';% path to the patches
            PathToPCA = '../results/LIVE/wn/PCA/';    % Path to PCA
            PathToScores = '../results/LIVE/wn/';         % Path to scores
            PathToDict = '../results/LIVE/wn/Dicts/';     % Path to dictionary            
            noImages = 174;
        else        
            mkdir('../results/LIVE','gblur');                % Directory for jp2k results
            mkdir('../results/LIVE/gblur','patches');        % Directory for patches
            mkdir('../results/LIVE/gblur','PCA');            % Directory for PCA
            mkdir('../results/LIVE/gblur','Dicts')           % Directory for dictionaries
            
            PathToImgs = '../../Database/LIVE/data/gblur/';  % path to the images
            PathToPatches = '../results/LIVE/gblur/patches/';% path to the patches
            PathToPCA = '../results/LIVE/gblur/PCA/';    % Path to PCA
            PathToScores = '../results/LIVE/gblur/';         % Path to scores
            PathToDict = '../results/LIVE/gblur/Dicts/';     % Path to dictionary            
            noImages = 174;
        end
    elseif(data == 2)    

    elseif(data == 3)    

    end
end