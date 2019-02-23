%if everything fails remeber you can save data two_matches as csv and useit

close all;
clear;
clc;

load dataset_small.mat;
imagedata = alldata.imagedata;
cameradata = alldata.cameradata;
pointdata = alldata.pointdata;

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
    image_data = all_data{(2*i)-1};
    c = strsplit(image_data);
    c = c(end);
    imagedata(i).name = c;
end

alldata.imagedata = imagedata;
alldata.cameradata = cameradata;
alldata.pointdata = pointdata;

save('dataset_small.mat','alldata')