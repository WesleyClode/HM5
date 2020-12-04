function [x, J_history] = gradientDescentMulti(A, y, x, gamma, lambda, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
for iter = 1:num_iters

    predictions =  A * x;
    updates = A' * (predictions - y)+ 2 * lambda * x;
    x = x - gamma * updates;
    J = computeCost(A, y, x, lambda, 2);
    % ============================================================  
    
    if iter > 2 && abs(J-J_history(iter-1))<1e-7
        break
    end
    
    J_history(iter) = J;
end

end
