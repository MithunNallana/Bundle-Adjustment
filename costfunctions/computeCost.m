function [cost] = computeCost(x,xids,nimgs,cameradata,ftsorg,ftsids,costfunction,err)
%COMPUTECOST Summary of this function goes here
%   Detailed explanation goes here

if costfunction == 1
    if nargin > 7
        cost = norm(err,2)^2;
    else
        ftspred = computeFeatures(x,xids,nimgs,cameradata,ftsids);
        err = (ftspred-ftsorg);
        cost = norm(err,2)^2;
    end
elseif costfunction == 2
    % pass
elseif costfunction == 3
    % pass
elseif costfunction == 4
    % pass
end


end

