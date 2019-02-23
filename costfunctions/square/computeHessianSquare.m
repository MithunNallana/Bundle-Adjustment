function [H] = computeHessianSquare(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,err )
%COMPUTEHESSIAN Summary of this function goes here
%   Detailed explanation goes here

camparms = 6; 
ptparms = 3;

% n_org = (size(x,1) - camparms*nimgs);

totalparms = camparms*nimgs + ptparms*npts;
H = zeros(totalparms,totalparms);
ptids = xids(nimgs+1:end,1);
cshift = nimgs*camparms;
count = 1;

for i = 1:nimgs
    % fixing cam par
    K = cameradata(xids(i,1)).intrinsics;
    temp_camperms  = [K(1,1); K(2,2); K(1,3); K(2,3); x(camparms*(i-1)+1:camparms*i)];
    
    for j = 1:size(ftsids(i).ids,2)
        temp_ptid = ftsids(i).ids(1,j);
        temp_rid = find(ptids==temp_ptid);
        temp_pt = x(cshift+ptparms*(temp_rid-1)+1:cshift+ptparms*(temp_rid),1);
        
        curerr = err(count:count+1);
        
            % first x
        err_x = curerr(1);
        H((i-1)*camparms+1:(i)*camparms, (i-1)*camparms+1:(i)*camparms) = ...
            H((i-1)*camparms+1:(i)*camparms, (i-1)*camparms+1:(i)*camparms) + ...
            + computeHessianXCameraParamCameraParam(temp_pt,temp_camperms)*err_x;
        
        H((i-1)*camparms+1:(i)*camparms, cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid) = ...
            H((i-1)*camparms+1:(i)*camparms, cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid) + ...
             + computeHessianXCameraParamPoint(temp_pt,temp_camperms)*err_x;
        
        H(cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid, cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid) = ...
            H(cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid, cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid) + ...
            + computeHessianXPointPoint(temp_pt,temp_camperms)*err_x;
        
            
        % second y
        err_y = curerr(2);
        H((i-1)*camparms+1:(i)*camparms, (i-1)*camparms+1:(i)*camparms) = ...
            H((i-1)*camparms+1:(i)*camparms, (i-1)*camparms+1:(i)*camparms) + ...
            + computeHessianYCameraParamCameraParam(temp_pt,temp_camperms)*err_y;
        
        H((i-1)*camparms+1:(i)*camparms, cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid) = ...
            H((i-1)*camparms+1:(i)*camparms, cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid) + ...
             + computeHessianYCameraParamPoint(temp_pt,temp_camperms)*err_y;
        
        H(cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid, cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid) = ...
            H(cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid, cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid) + ...
            + computeHessianYPointPoint(temp_pt,temp_camperms)*err_y;
        count = count + 2;
    end
end

H(cshift+1:end,1:cshift) = H(1:cshift,cshift+1:end)';
rowno = size(H,1);

% cleanup
delcols = [];
for i = (nimgs*camparms)+1:3:rowno-3
    if isequal(H(:,i:i+2),zeros(rowno,3))
        delcols = [delcols, i:i+2];
    end
end
H(:,delcols) = [];

colno = size(H,2);
delrows = [];
for i = (nimgs*camparms)+1:3:rowno-3
    if isequal(H(i:i+2,:),zeros(3,colno))
        delrows = [delrows, i:i+2];
    end
end
H(delrows,:) = [];

end

