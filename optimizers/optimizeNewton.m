function [x_updated] = optimizeNewton(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction,MAXITER,TOL)
%OPTIMIZENEWTON Summary of this function goes here
%   Detailed explanation goes here

ALPHA = 0.2;
BETA = 0.6;

for iter = 1:MAXITER
    
    [J,J_model,err] = computeJacobian(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction);
    H = computeHessian( x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction,J_model,err );
    
    % small addition
    H = H + (1e-8)*eye(size(H));
    
    delx = -H\J;
    
    lambdasquare = -J'*delx;
    cost = computeCost(x,xids,nimgs,cameradata,ftsorg,ftsids,costfunction,err);
    
    t = 5;
    while(computeCost(x+t*delx,xids,nimgs,cameradata,ftsorg,ftsids,costfunction) > ...
            cost + ALPHA*t*J'*delx)
        t = t*BETA;
    end
    x = x + t*delx;
    
    if lambdasquare/2 <= TOL
        break;
    end
    disp(['Iteration: ',num2str(iter),'   Cost is ',num2str(cost)]);
    
end

x_updated = x;

end

