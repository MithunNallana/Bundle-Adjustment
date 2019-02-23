function test_features( fts_1, fts_2 )
%TEST_FEATURES Summary of this function goes here
%   Detailed explanation goes here

img_1 = 'l-115.jpg';
img_2 = 'l-212.jpg';

pth1 = imread(strcat('./data/',img_1));
pth2 = imread(strcat('./data/',img_2));

idx = [1,2,3,4,5,6,7,8,9];

figure(1); ax = axes;
showMatchedFeatures(pth1,pth2,fts_1(idx,:),fts_2(idx,:),'montage','Parent',ax);
title(ax, 'Candidate point matches');
legend(ax, 'Matched points 1','Matched points 2');

% figure(1);
% 
% subplot(1,2,1);
% hold on;
% imshow(pth1);
% plot(fts_1(idx,1),fts_1(idx,2),'rO');
% 
% subplot(1,2,2);
% hold on;
% imshow(pth2);
% plot(fts_2(idx,1),fts_2(idx,2),'rO');

end

