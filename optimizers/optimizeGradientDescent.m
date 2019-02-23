function [x_updated] = optimizeGradientDescent(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction,MAXITER,TOL)
%OPTIMIZEGRADIENTDESCENT Summary of this function goes here
%   Detailed explanation goes here

% for back track line search 
ALPHA = 0.4;
BETA = 0.8;

for iter = 1:MAXITER
    
    [J,~,err] = computeJacobian(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction );
    if(norm(J) < TOL)
        break;
    end
    cost = computeCost(x,xids,nimgs,cameradata,ftsorg,ftsids,costfunction,err);
    delx = -J;
    t = 1;
    while(computeCost(x+t*delx,xids,nimgs,cameradata,ftsorg,ftsids,costfunction) > ...
            cost + ALPHA*t*J'*delx)
        t = t*BETA;
    end
    x = x + t*delx;
    
    disp(['Iteration: ',num2str(iter),'   Cost is ',num2str(cost)]);
    
end

x_updated = x;


end

