%% 2.Linear regularized LS L2
%
%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');
%% Load Data

filename1 = 'data_problem1/data.txt';
filename2 = 'data_problem1/label.txt';
A = importdata(filename1);
y = importdata(filename2);

%m = size(y, 1);% number of training examples
var = size(A, 2);% number of variables

%% ================ Part 2: Gradient Descent ================
fprintf('Running gradient descent ...\n');

% Choose some alpha value
gamma = 0.00001;
num_iters = 10000;
lambda = 0.1;
% Init Theta and Run Gradient Descent 
%theta = zeros(var+1, 1);
x = zeros(var, 1);

[x_new, J_history] = gradientDescentMulti(A, y, x, gamma, lambda, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', x_new);
fprintf('\n');

writematrix(x_new,'sol2.txt','Delimiter','tab')
type 'sol2.txt'