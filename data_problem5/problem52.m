%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');
%% Load Data

filename1 = 'data1.mat';
face1 = importdata(filename1);
s = svd(face1);
sigma = s.*s;

D = 2016;
N = 10;

% compute the d with respect different threshold
comp = zeros(1,length(sigma));
xx = zeros(1,length(sigma));
for i=1:length(sigma)
    xx(i) = fd(sigma,i);
end


for i=[1,4,6,8]
    comp(i) = compression(i);
end
