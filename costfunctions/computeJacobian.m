function [ J, J_model, err ] = computeJacobian( x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction )

if costfunction == 1
    J_model = computeJacobianSquare( x,xids,nimgs,npts,cameradata,ftsids);
    ftspred = computeFeatures(x,xids,nimgs,cameradata,ftsids);
    err = (ftspred-ftsorg);
    J = (J_model'*err);
elseif costfunction == 2
    % pass
elseif costfunction == 3
    % pass
elseif costfunction == 4
    % pass
end

end



