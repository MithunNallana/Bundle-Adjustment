
pointdata = alldata_before.pointdata;
pointdata = pointdata(pointdata(:,4)==1,:);

T = delaunay(pointdata(:,1),pointdata(:,2));

figure(1);
hold on;
view([1,-64]);
xlim([-5 5])
ylim([-5 5])
zlim([0 10])
trimesh(T,pointdata(:,1),pointdata(:,2),pointdata(:,3))
%plotPointsCameras(alldata_be);

% stupid way to do this
% [X,Y] = meshgrid(pointdata(:,1),pointdata(:,2));
% Z = griddata(pointdata(:,1),pointdata(:,2),pointdata(:,3),X,Y);
% surf(X,Y,Z)