function [ gradient ] = derevative( h, y, X, thetaLen)
%GRADIENT Summary of this function goes here
%   Detailed explanation goes here

g = zeros(thetaLen, 1);
diff = h - y;
for i = 1:thetaLen
    arr = diff.*X(:,i);
    g(i,1) = sum(arr);
end
gradient = g;
end

