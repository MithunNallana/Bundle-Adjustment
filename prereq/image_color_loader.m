close all;
clear;
clc;

formatSpec = '%s%s%s%s%s%s%s%s%s%s%[^\n\r]';
filename = 'points3D.txt';
delimiter = ',';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
fclose(fileID);
dataArray = dataArray{1};

enddata = dataArray(end);
enddata = enddata{1};
c = str2num(enddata);
pointdata = zeros(c(1),3);

for i = 4:size(dataArray,1)
    middata = dataArray(i);
    middata = middata{1};
    c = str2num(middata);
    pointcolor(c(1),1:3) = c(5:7)/255;
end

save('dataset_color.mat','pointcolor');
    