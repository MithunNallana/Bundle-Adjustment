function [ft] = computeFeature(pt,campr)
%COMPUTEFEATURE Summary of this function goes here
%   Detailed explanation goes here

K = [campr(1),0,campr(3);
     0, campr(2),campr(4);
     0,0,1];
R = convertToRotationMatrix(campr(5:7));
t = campr(8:10);
pt = [pt;1];
ft = K*[R,t]*pt;
ft = ft(1:2)/ft(3);

end

