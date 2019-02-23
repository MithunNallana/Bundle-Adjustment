function [ angleaxis ] = convertToAngleAxis( rotation_matrix )
%CONVERTTOANGLEAXIS Summary of this function goes here
%   Detailed explanation goes here

theta = acos((trace(rotation_matrix)-1)/2);

if theta == 0
    angleaxis = [0;0;0];
else
    tempr = [rotation_matrix(3,2)-rotation_matrix(2,3);
              rotation_matrix(1,3)-rotation_matrix(3,1);
              rotation_matrix(2,1)-rotation_matrix(1,2)];
    omega = (1/(2*sin(theta)))*tempr;
    angleaxis = omega*theta;
end

end

