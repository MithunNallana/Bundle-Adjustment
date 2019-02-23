function [alldata] = updateData(x,xids,nimgs,alldata)
%UPDATEDATA Summary of this function goes here
%   Detailed explanation goes here

for i=1:nimgs
    alldata.imagedata(i).extrinsics = x(6*(i-1)+1:6*(i),1);
end

for i=1:(size(xids,1)-nimgs)
    alldata.pointdata(xids(nimgs+i),1:3) = x(6*nimgs+3*(i-1)+1:6*nimgs+3*i,1);
    alldata.pointdata(xids(nimgs+i),4) = 1; 
end

end

