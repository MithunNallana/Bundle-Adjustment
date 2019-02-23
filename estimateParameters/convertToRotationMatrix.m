function [ rotationmatrix ] = convertToRotationMatrix( angleaxis )
%CONVERTTOROTATIONMATRIX Summary of this function goes here
%   Detailed explanation goes here

theta = norm(angleaxis,2);
if theta == 0
    omega = [0;0;0];
else
    omega = angleaxis/theta;
end
omegax = [0, -omega(3), omega(2);
          omega(3), 0, -omega(1);
          -omega(2), omega(1), 0]; 

rotationmatrix = eye(3) + sin(theta)*omegax + (1-cos(theta))*omegax*omegax;

end

