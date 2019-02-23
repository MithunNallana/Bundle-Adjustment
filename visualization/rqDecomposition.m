function [ R, Q ] = rqDecomposition( P )
%RQDECOMPOSITION Summary of this function goes here
%   algoritm implemented from mvg 579 page using
%   Given's rotations.
%   TODO what happens if p(3,3)=0
%   Verified for bugs with matlab code.

% set a32 to be zero
if P(3,2) == 0
    P = P;
    Rx = eye(3);
else
    costh = P(3,3)/sqrt((P(3,3)^2 + P(3,2)^2));
    sinth = -(P(3,2)/P(3,3))*costh;
    Rx    = [ 1, 0, 0; 0, costh, -sinth; 0, sinth, costh];
    P  = P * Rx;
end

% set a31 to be zero
if P(3,1) == 0
    P = P;
    Ry = eye(3);
else
    costh = P(3,3)/sqrt((P(3,3)^2 + P(3,1)^2));
    sinth = (P(3,1)/P(3,3))*costh;
    Ry    = [ costh, 0, sinth; 0, 1, 0; -sinth, 0, costh];
    P  = P * Ry;
end

% set a21 to be zero
if P(2,1) == 0
    P = P;
    Rz = eye(3);
else
    costh = P(2,2)/sqrt((P(2,1)^2 + P(2,2)^2));
    sinth = -(P(2,1)/P(2,2))*costh;
    Rz    = [ costh, -sinth, 0; sinth, costh, 0; 0, 0, 1];
    P  = P * Rz;
end

R = P;
Q = Rz'*Ry'*Rx';

end

