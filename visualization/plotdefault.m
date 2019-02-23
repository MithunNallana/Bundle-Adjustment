function [] = plotdefault(alldata_before, alldata_after, pointcolor)
%PLOTDEFAULT Summary of this function goes here
%   Detailed explanation goes here

figure(21);

ax1 = subplot(1,2,1);
hold on;
view([1,-64]);
% xlim([-1.5 1.5])
% ylim([-1.5 1.5])
% zlim([0 3])
axis equal;
plotPointsCameras(alldata_before,pointcolor);

ax2 = subplot(1,2,2);
hold on;
view([1,-64]);
% xlim([-1.5 1.5])
% ylim([-1.5 1.5])
% zlim([0 3])
axis equal;
plotPointsCameras(alldata_after,pointcolor);

Link = linkprop([ax2, ax1],{'CameraUpVector', 'CameraPosition', 'CameraTarget'});
setappdata(gcf, 'StoreTheLink', Link);
% , 'XLim', 'YLim', 'ZLim'
end

