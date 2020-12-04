function [x, J_history] = Major_min_method(A, y, x, gamma, lambda, c,num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
sigma = lambda/c;
for iter = 1:num_iters
    x  = A'*(y-A*x)/c+x;
    x = soft_thresholding(x, sigma);
    J = computeCost(A, y, x, lambda, 1);
    % ============================================================  
    
    if iter > 2 && abs(J-J_history(iter-1))<1e-6
        break
    end
    
    J_history(iter) = J;
end

end
