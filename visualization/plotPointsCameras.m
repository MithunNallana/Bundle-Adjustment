function [] = plotPointsCameras(alldata,pointcolor)
%PLOTPOINTSCAMERAS Summary of this function goes here
%   Detailed explanation goes here

pts = alldata.pointdata;

for i = 1:size(pts,1)
    if pts(i,4) == 1
        plot3(pts(i,1),pts(i,2), pts(i,3),'.','Color',pointcolor(i,:),'MarkerSize', 2);
    end
end

imgs = alldata.imagedata;
for i = 1:size(imgs,2)
    e = alldata.imagedata(i).extrinsics;
    R = convertToRotationMatrix(e(1:3));
    plotCamera3d(R,e(4:6),0.2,alldata.imagedata(i).name);
end

end

