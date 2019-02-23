function [x_updated] = optimizeParameters(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction,method)
%OPTIMIZEPARAMETERS Summary of this function goes here
%   Detailed explanation goes here

MAXITER = 50;
TOL = 1e-6;

if method == 1
    x_updated = optimizeGradientDescent(x,xids,nimgs,npts,cameradata,ftsorg,ftsids, ...
                                  costfunction,MAXITER,TOL);
elseif method == 2
    % pass
elseif method == 3
    x_updated = optimizeNewton(x,xids,nimgs,npts,cameradata,ftsorg,ftsids, ...
                                  costfunction,MAXITER,TOL);
elseif method == 4
    x_updated = optimizeLavenberg(x,xids,nimgs,npts,cameradata,ftsorg,ftsids, ...
                                  costfunction,MAXITER,TOL);
elseif method == 5
    x_updated = optimizeLavenbergMarquardt(x,xids,nimgs,npts,cameradata,ftsorg,ftsids, ...
                                  costfunction,MAXITER,TOL); 
end

end

