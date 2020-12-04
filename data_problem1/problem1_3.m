%%
clc;
clear;
% compare L0 norm (the number of non-zero elements) 
% of X_ls computed by above two algorithms;
filename1 = 'sol1.txt';
filename2 = 'sol2.txt';
sol1 = importdata(filename1);
sol2 = importdata(filename2);

filename1 = 'data_problem1/data.txt';
filename2 = 'data_problem1/label.txt';
A = importdata(filename1);
y = importdata(filename2);

n1 = nnz(sol1);
n2 = nnz(sol2);


L2_loss1 = norm(A*sol1 - y,2)^2;
L2_loss2 = norm(A*sol2 - y,2)^2;


