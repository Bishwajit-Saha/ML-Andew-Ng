function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

sum = 0;
hx = [];
for i=1:m
    hx(i) = sigmoid( X(i,:)*theta);
    sum = sum + ( -y(i)*log(hx(i)) - (1 - y(i))*log (1 - hx(i)) );
end

sumThetaSq = 0;
for i = 2:length(theta)
    sumThetaSq = sumThetaSq + (theta(i)*theta(i));
end
J = (sum + lambda*sumThetaSq/2)/m;

%gradient part of Code
s = size(theta);
s = s(1);
for j=1:s
    temp = 0;
    for i=1:m
        temp = temp + (hx(i) - y(i))*X(i,j);
    end
    temp = temp + lambda*theta(j);
    temp = temp/m;
    grad(j) = temp;
end  
grad(1) = grad(1) - (lambda*theta(1)/m);
%theta = theta - grad;
% =============================================================

end
