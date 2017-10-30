function [ data_nr ] = normalize( data, mu, sigma )
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here

data_nr = data;
for i = 1:length(data)
    data_nr(i) = (data(i) - mu(i))/sigma(i);
end


end

