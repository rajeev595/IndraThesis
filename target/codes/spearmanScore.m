% This function calculates the SROCC values
% Input: distortion ---- 1 for jp2k, 2 for jpeg, 3 for wn, 4 for gblur
%        data ---------- 1 for LIVE, 2 for CSIQ, 3 for TID2008
%        PathToScores -- Path to save the calculated scores
% Output: N/A

function spearmanScore(distortion,data,PathToScores)

    if(data == 1)
        load('../../Database/LIVE/dmos.mat');
        if(distortion == 1)
            dmos = dmos(1 : 227);
            orgs = orgs(1 : 227);
        elseif(distortion == 2)
            dmos = dmos(228 : 460);
            orgs = orgs(228 : 460);
        elseif(distortion == 3)
            dmos = dmos(461 : 634);
            orgs = orgs(461 : 634);
        else
            dmos = dmos(635 : 808);
            orgs = orgs(635 : 808);
        end
    elseif(data == 2)
       
    elseif(data == 3)

    end

% Indices of distorted Images
    distIndcs = find(~orgs);

% DMOS values for only distorted images
    dmos = dmos(distIndcs);

%------------------------------------------------------------%
%-------------GLOBAL SCORES CORRELATION----------------------%
%------------------------------------------------------------%
    f = strcat(PathToScores,'GlobalScores.mat');
    load(f);
    
    scores = scores(distIndcs,:);
    
    scoresPCA = scores(:,1);
    scoresDict = scores(:,2);
    
    sroccPCA = corr(scoresPCA, dmos', 'Type', 'Spearman');
    sroccDict = corr(scoresDict, dmos', 'Type', 'Spearman');
    
    f = strcat(PathToScores,'CorrelationScoreGlobal.mat');
    save(f,'sroccPCA','sroccDict');
%------------------------------------------------------------%
%--------------LOCAL SCORES CORRELATION----------------------%
%------------------------------------------------------------%
    f = strcat(PathToScores,'LocalScores.mat');
    load(f);
    
    scores = scores(distIndcs,:);
    
    scoresL = scores(:,1);
    scoresT = scores(:,2);
    
    sroccL = corr(scoresL, dmos', 'Type', 'Spearman');
    sroccT = corr(scoresT, dmos', 'Type', 'Spearman');
    
    f = strcat(PathToScores, 'CorrelationScoreLocal.mat');
    save(f, 'sroccL', 'sroccT');
end