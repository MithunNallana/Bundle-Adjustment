function [fts_pred] = computeFeatures(x,xids,nimgs,cameradata,ftsids)
%COMPUTEFEATURES Summary of this function goes here
%   Detailed explanation goes here

ptids = xids(nimgs+1:end,1);
cshift = (nimgs*6);

tempcount = 0;
for i = 1:nimgs
    tempcount = tempcount + size(ftsids(i).ids,2);
end

fts_pred = zeros(tempcount,1);

count = 1;
for i = 1:nimgs
    K = cameradata(xids(i,1)).intrinsics;
    e = x(6*(i-1)+1:6*i);
    R = convertToRotationMatrix(e(1:3));
    t = e(4:6);
    for j = 1:size(ftsids(i).ids,2)
        temp_ptid = ftsids(i).ids(1,j);
        temp_rid = find(ptids==temp_ptid);
        temp_pt = x(cshift+3*(temp_rid-1)+1:cshift+3*(temp_rid),1);
        temp_pt = [temp_pt;1];
        temp_fts = K*[R,t]*temp_pt;
        fts_pred(count) = temp_fts(1)/temp_fts(3);
        fts_pred(count+1) = temp_fts(2)/temp_fts(3);
        count = count+2;
    end
end

end

