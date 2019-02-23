function [ K, R, t ] = decomposeProjectionMatrix( projection_matrix )
%DECOMPOSEPROJECTIONMATRIX Summary of this function goes here
%   Notation followed P = KR[I|-t]
%   Where K is the calibration matrix
%   R is the description of World Frame in Camera
%   t is the location of camera's orign in world
%   We decompose first part of projection matrix using RQ decomposition.

temp_mat = projection_matrix(1:3, 1:3);
[K, R] = rqDecomposition(temp_mat);
t = -R'*(K\projection_matrix(1:3, 4));

end

