%% cleaning up environment

close all;
clear;
clc;

%% User parameters

filename = 'dataset_1.mat';
colordata = 'dataset_color_1.mat';

% fastest 1,2 and it is important.
basecam1 = 1;
basecam2 = 2;

% for south building dataset
% imagewidth = 3072;
% imageheight = 2304;

% for zed dataset
imagewidth = 1280;
imageheight = 720;

% for dino dataset
%imagewidth = 720;
%imageheight = 576;

% error model for BA
% identifier        error-model
%     1              gaussian        - done
%     2           Blake-Zisserman    - In progress
%     3          Corrupted Gaussian
%     4               Cauchy
%     5              L1 cost
%     6             Huber cost
costfunction = 1;

% method used for BA
% identifier           method
%      1           vinila-gradient - done
%      2             gauss-newton
%      3               newton       - In progress
%      4              Lavenberg    - done - fast and stable
%      5         Levenberg-Marquardt - done 
method = 3;

%% loading and setting up data
% try to mex stuff for speed up

disp('Loading data...');
currentfolder = pwd;
load(fullfile(currentfolder, filename));
addpath(genpath(currentfolder));

disp('Estimating initial parameters...');
[x, xids, nimgs, npts] = estimateParameters(alldata, basecam1, basecam2, imagewidth, imageheight);
% alldata = updateData(x,xids,nimgs,alldata);
% alldata_before = alldata;
% save('./estimateParameters/saved_param.mat','x','xids','nimgs','npts','alldata','alldata_before');

load('saved_param.mat');
alldata_before = alldata;
cameradata = alldata.cameradata;

nfts = 0;
for i=1:nimgs
    nfts = nfts + alldata.imagedata(i).npts;
end
ftsorg = zeros(2*nfts,1);
count = 1;
for i = 1:nimgs
    for j = 1:alldata.imagedata(i).npts
        x1 = alldata.imagedata(i).x(j);
        y1 = alldata.imagedata(i).y(j);
        ftsorg(count:count+1,1) = [x1;y1];
        count = count+2;
    end
    ftsids(i).ids = alldata.imagedata(i).ptid;
end

disp('Starting BA...');
printMethodCost(method,costfunction);
x = optimizeParameters(x,xids,nimgs,npts,cameradata,ftsorg,ftsids,costfunction,method);
alldata = updateData(x,xids,nimgs,alldata);
alldata_after = alldata;

disp('Chill down... done');
load(colordata)
plotdefault(alldata_before, alldata_after,pointcolor);

% save('del_b.mat','alldata_before');
% save('del_a.mat','alldata_after');


% plotPoints(); % assing colour form data
% plotCamera(); % refer prebuilt code
% denseReconstruction(); % refer cmu trimesh and patch. must look amazing.
rmpath(genpath(currentfolder));