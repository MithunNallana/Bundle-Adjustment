function [ H ] = computeHessian( x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction,J_model,err )
%COMPUTEHESSIAN Summary of this function goes here
%   Detailed explanation goes here

if costfunction == 1
    H = computeHessianSquare(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,err );
    H = J_model'*J_model + H;
elseif costfunction == 2
    % pass
elseif costfunction == 3
    % pass
elseif costfunction == 4
    % pass
end


end

