%if everything fails remeber you can save data two_matches as csv and useit

close all;
clear;
clc;

delimiter = ',';
startRow = 5;
endRow = inf;

formatSpec = '%s%s%f%s%s%s%s%s%s%s%[^\n\r]';
fileID = fopen('images.txt','r');
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end
fclose(fileID);

all_data = dataArray{:, 1};
num_images = 5;

tpts = [];
for i=1:num_images
    image_data = all_data{2*i};
    c = strsplit(image_data);
    size_n = size(c,2)/3;
    c = reshape(c,3,size_n);
    cx = str2double(c(1,:));
    cy = str2double(c(2,:));
    cid = str2double(c(3,:));
    ind = (cid ~= -1);
    cid = cid(ind);
    cx = cx(ind);
    cy = cy(ind);
    [cid, ind] = unique(cid);
    cx = cx(ind);
    cy = cy(ind);
    [imagedata(i).ptid,ind] = sort(cid);
    imagedata(i).x = cx(ind);
    imagedata(i).y = cy(ind);
    imagedata(i).cam = 1;
    imagedata(i).npts = size(imagedata(i).x,2);
    imagedata(i).extrinsics = zeros(6,0);
    tpts = unique([imagedata(i).ptid,tpts]);
end

cameradata(1).intrinsics = [864,0,360;
                            0,864,288;
                            0,0,1];

ptsize = max(tpts);
pointdata = [zeros(ptsize,3),-1*ones(ptsize,1)];

alldata.imagedata = imagedata;
alldata.cameradata = cameradata;
alldata.pointdata = pointdata;

save('dataset_small.mat','alldata')