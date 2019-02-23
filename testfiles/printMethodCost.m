function [outputArg1,outputArg2] = printMethodCost(method, costfunction)
%PRINTMETHODCOST Summary of this function goes here
%   Detailed explanation goes here

if method == 1
    disp('Method : Vinilla-Gradient descent');
    disp('*Tip: You can go for a vacation to france before it converges*');
elseif method == 2
    disp('Method : Gauss-Newton');
    disp('*Tip: *');
elseif method == 3
    disp('Method : Newton/Damped Newton');
    disp('*Tip: Either you are confiedent about your initial estimate or You have time and resources*')
elseif method == 4
    disp('Method : Lavenberg');
    disp('*Tip: Wise decision*');
elseif method == 5
    disp('Method : Lavenberg-Marquardt')
    disp('*Tip: Wise decision*');
end

if costfunction == 1
    disp('Method : Squared error (Gaussian Noise assumption)');
    disp('*Tip: Either you are stupid or You are so confident about feature matches*');
elseif costfunction == 2
    disp('Method : Blake-Zisserman');
    disp('*Tip: *');
elseif costfunction == 3
    disp('Method : Corrupted Gaussian');
    disp('*Tip: *')
elseif costfunction == 4
    disp('Method : Cauchy');
    disp('*Tip: *');
elseif costfunction == 5
    disp('Method : L1-cost')
    disp('*Tip: *');
elseif costfunction == 6
    disp('Method : Huber')
    disp('*Tip: *');
end

end

