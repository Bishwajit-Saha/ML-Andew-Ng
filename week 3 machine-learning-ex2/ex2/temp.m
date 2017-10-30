data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);
[m, n] = size(X);
X = [ones(m, 1) X];
%theta = zeros(n + 1, 1);
theta = [1; 2; 3];
theta = theta + 2;
[J, grad] = costFunctionReg(theta, X, y, 2);

fprintf('J(o): %f\n', J);
%fprintf('Gradient at initial theta (zeros): \n');
fprintf('grad %f \n', grad);
