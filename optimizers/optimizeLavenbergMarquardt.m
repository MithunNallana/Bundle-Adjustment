function [x_updated] = optimizeLavenbergMarquardt(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction,MAXITER,TOL)
%OPTIMIZELAVENBERGMARQUARDT Summary of this function goes here
%   Detailed explanation goes here

mu = 10;

for iter = 1:MAXITER
    
    [J,J_model,err] = computeJacobian(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction);
    H = J_model'*J_model;
    prevcost = computeCost(x,xids,nimgs,cameradata,ftsorg,ftsids,costfunction,err);
    
    if iter == 1
        lambda = 1;
    end
    
    marquardt_scale = diag(diag(H));
    H_lavenberg = H + lambda*marquardt_scale;
    delx = -H_lavenberg\J;
    x_new = x + delx;
    curcost = computeCost(x_new,xids,nimgs,cameradata,ftsorg,ftsids,costfunction);
    
    if curcost < prevcost
        if (prevcost-curcost) <= TOL
            break;
        else
            x = x_new;
        end
        lambda = lambda/mu;
    else
        while curcost >= prevcost
            lambda  = lambda*mu;
            H_lavenberg = H + lambda*marquardt_scale;
            delx = -H_lavenberg\J;
            x_new = x + delx;
            curcost = computeCost(x_new,xids,nimgs,cameradata,ftsorg,ftsids,costfunction);
        end
        x = x_new;
    end
    disp(['Iteration: ',num2str(iter),'   Cost value is ',num2str(prevcost)]);
    
end

x_updated = x_new;

end

