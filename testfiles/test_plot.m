figure(1);
hold on;
axis equal;
view(3);
plot3(pointdata(:,1),pointdata(:,2),pointdata(:,3),'k.')
plotCamera3d(P1,0.1);
plotCamera3d(P2,0.1);