function J = computeCost(X, y, theta, lambda ,norms)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


predictions =  X*theta;
sqerrors = (predictions - y).^2;
if norms == 1
    J = 1/(2*m)* sum(sqerrors) + lambda * norm(X,1);
elseif norms == 2
    J = 1/(2*m)* sum(sqerrors) + lambda * norm(X,2);
elseif norms == 0
    J = 1/(2*m)* sum(sqerrors) + lambda * nnz(X);
end

% =========================================================================

end
