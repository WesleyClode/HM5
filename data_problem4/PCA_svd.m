function [mu, u, singular, u_d] = PCA_svd(X, num_component)

[~, num_data] = size(X);
mu = mean(X,2);
mean_20 = mean(X,2)*ones(1,num_data);
Xbar = (X-mean_20);
singular = svd(Xbar);
[u, ~, ~] = svd(Xbar,'econ');
u_d = u(:,1:num_component);

end
