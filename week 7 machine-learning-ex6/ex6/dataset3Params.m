function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
choice = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
l = length(choice);
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
predictionsError = zeros(l,l);
for c = 1:l
    for s = 1:l
        model= svmTrain(X, y, choice(c), @(x1, x2) gaussianKernel(x1, x2, choice(s))); 
        predictions = svmPredict(model, Xval);
        predictionsError(c,s) = mean(double(predictions ~= yval));
    end
end

data = min(min(predictionsError));
[r,c] = find(predictionsError == data);
C = choice(r);
sigma = choice(c);


% =========================================================================

end
