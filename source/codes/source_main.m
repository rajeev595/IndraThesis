% main file for source set

tic
clear all
close all

% Path to the main source directory
mainSrcPath = '../';

%% parameters for patch extraction
w = 11;                  % Patch size = W x W
noPatches = 500;
entropy_thresh = 3;

%% extract patches and save in the result folder

Xs = getSourcePatches(w, noPatches, entropy_thresh);
save(strcat(mainSrcPath,'SourcePatches.mat'),'Xs','entropy_thresh');

%% perform PCA 

[s_coeff, ~, ~, ~, s_explained] = pca(Xs');
save(strcat(mainSrcPath,'SourcePCA.mat'),'s_coeff','s_explained');

%% Dictionary Learning

% params for dictionary learning
params.data = Xs;
params.Edata = 0.01;
params.iternum = 15;
params.exact = 1;
params.dictsize = 500;
%[source_dict,source_coeff,Edata,iter] = learnDictionary(params);
%save(strcat(mainSrcPath,'SourceDictionary.mat'),'source_dict','source_coeff','Edata','iter');

%%
toc