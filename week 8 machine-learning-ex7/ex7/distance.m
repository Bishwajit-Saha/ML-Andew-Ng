function d = distance(x,y)

x_size = length(x);
y_size = length(y);

d = 0;
if( x_size == y_size)
    diff = x - y;
    d = sqrt(sum(diff.^2));
end
end