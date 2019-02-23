function [J] = computeJacobianSquare( x,xids,nimgs,npts,cameradata,ftsids)
%COMPUTEJACOBIANSQUARE Summary of this function goes here
%   Detailed explanation goes here
camparms = 6; 
ptparms = 3;

tempcount = 0;
for i = 1:nimgs
    tempcount = tempcount + size(ftsids(i).ids,2);
end

totalcols = (nimgs*camparms)+(npts*ptparms);
J = zeros(2*tempcount, totalcols);

rowno = 0;
cshift = (nimgs*camparms);
ptids = xids(nimgs+1:end,1);

for eachimg = 1:nimgs
    
    K = cameradata(xids(eachimg,1)).intrinsics;
    temp_camperms  = [K(1,1); K(2,2); K(1,3); K(2,3); x(camparms*(eachimg-1)+1:camparms*eachimg)]; 
    
    for eachpt =1:size(ftsids(eachimg).ids,2)
        temp_ptid = ftsids(eachimg).ids(1,eachpt);
        temp_rid = find(ptids==temp_ptid);
        temp_pt = x(cshift+ptparms*(temp_rid-1)+1:cshift+ptparms*(temp_rid),1);
        J(rowno+(2*eachpt-1):rowno+(2*eachpt), camparms*(eachimg-1)+1:camparms*eachimg) = ...
            computeJacobianCameraParam(temp_pt, temp_camperms);
        
        J(rowno+(2*eachpt-1):rowno+(2*eachpt), cshift+(ptparms*(temp_ptid-1)+1):cshift+ptparms*temp_ptid) =  ...
            computeJacobianPoint(temp_pt, temp_camperms);
    end
    rowno = rowno + 2*size(ftsids(eachimg).ids,2);
end

% cleanup
delcols = [];
for i = (nimgs*camparms)+1:3:totalcols-3
    if isequal(J(:,i:i+2),zeros(rowno,3))
        delcols = [delcols, i:i+2];
    end
end
J(:,delcols) = [];
end

