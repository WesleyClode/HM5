%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');
%% Load Data

filename1 = 'data1.mat';
face1 = importdata(filename1);
s = svd(face1);
sigma = s.*s;

plot((1:numel(sigma)), sigma, '-b', 'LineWidth', 2);
xlabel('index');
ylabel('singular values');
title("Squared singular values of A")
hold on

plot((1:numel(sigma)), 150*ones(numel(sigma)), '-g', 'LineWidth', 2);

plot(2*ones(2500), (1:2500), '-r', 'LineWidth', 2);

xx = zeros(1,length(sigma));
for i=1:length(sigma)
    xx(i) = fd(sigma,i);
end

figure;

plot((1:numel(xx)), xx, '-b', 'LineWidth', 2);
stairs(xx);
xlabel('index_d');
ylabel('rate');
title("variance explained ratio")
