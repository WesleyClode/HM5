%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');
%% Load Data

filename1 = 'data_problem3/A1.txt';
filename2 = 'data_problem3/A2.txt';
filename3 = 'data_problem3/b1.txt';
filename4 = 'data_problem3/b2.txt';
A1 = importdata(filename1);
A2 = importdata(filename2);
b1 = importdata(filename3);
b2 = importdata(filename4);


%%
IterMax = 100000;
eps = 1e-10;
%% Jacobi
% [X1,N_Iter1,Xiter1,Error1]= Jacobi(A1,b1,IterMax,eps);
% [X2,N_Iter2,Xiter2,Error2]= Jacobi(A2,b2,IterMax,eps);
% %% Gauss-Seidel
% [X1,N_Iter1,Xiter1,Error1]= Seidel(A1,b1,IterMax,eps);
% [X2,N_Iter2,Xiter2,Error2]= Seidel(A2,b2,IterMax,eps);
%% SOR
% xx = zeros(30 ,1);
% for i=1:30
%     [X,N_Iter,Xiter,Error]= Relax(A1,b1,1/100*i,IterMax,eps);
%     xx(i) = N_Iter;
% end
% figure;
% plot((1:numel(xx))/100, xx, '-b', 'LineWidth', 2);
% xlabel('w');
% ylabel('number of iterations');
%% 3.Plot the error

%% 3.1
[X1,N_Iter1,Xiter1,Error1]= Jacobi(A1,b1,IterMax,eps);
error = zeros(length(N_Iter1),1);
for i=1:length(Xiter1(1,:))
    error(i) = norm(Xiter1(:,i)-X1);
end
figure;
plot((1:numel(error)), error, '-b', 'LineWidth', 0.5);
xlabel('number of iteration');
ylabel('L2 norm');
title("error of A1 = b1")
%saveas(gcf,'Jacobi_1.png')
hold on;
[X1,N_Iter1,Xiter1,Error1]= Seidel(A1,b1,IterMax,eps);
error = zeros(length(N_Iter1),1);
for i=1:length(Xiter1(1,:))
    error(i) = norm(Xiter1(:,i)-X1);
end

plot((1:numel(error)), error, '-g', 'LineWidth', 0.5);
xlabel('number of iteration');
ylabel('L2 norm');
%title("A1 b1 for Gauss-Seidel iteration")

[X1,N_Iter1,Xiter1,Error1]= Relax(A1,b1,1.5,IterMax,eps);
error = zeros(length(N_Iter1),1);
for i=1:length(Xiter1(1,:))
    error(i) = norm(Xiter1(:,i)-X1);
end

plot((1:numel(error)), error, '-y', 'LineWidth', 0.5);
legend('Jacobi','Gauss-seidel', 'SOR')

% xlabel('number of iteration');
% ylabel('L2 norm');
% title("A1 b1 for SOR Iteration iteration")
%saveas(gcf,'SOR_1.png')
%%

%% 3.2

%saveas(gcf,'Gauss_1.png')
%%

[X1,N_Iter1,Xiter1,Error1]= Jacobi(A2,b2,IterMax,eps);
error = zeros(length(N_Iter1),1);
for i=1:length(Xiter1(1,:))
    error(i) = norm(Xiter1(:,i)-X1);
end
%figure;
plot((1:numel(error)), error, '-b', 'LineWidth', 0.5);
%xlabel('number of iteration');
%ylabel('L2 norm');
%title("A2 b2 for Jacobi iteration")
%saveas(gcf,'Jacobi_2.png')

hold on;
[X1,N_Iter1,Xiter1,Error1]= Seidel(A2,b2,IterMax,eps);
error = zeros(length(N_Iter1),1);
for i=1:length(Xiter1(1,:))
    error(i) = norm(Xiter1(:,i)-X1);
end

plot((1:numel(error)), error, '-g', 'LineWidth', 0.5);
% xlabel('number of iteration');
% ylabel('L2 norm');
% title("A2 b2 for Gauss-Seidel iteration")
%saveas(gcf,'Gauss_2.png')
%% 3.3
[X1,N_Iter1,Xiter1,Error1]= Relax(A2,b2,1.5,IterMax,eps);
error = zeros(length(N_Iter1),1);
for i=1:length(Xiter1(1,:))
    error(i) = norm(Xiter1(:,i)-X1);
end

plot((1:numel(error)), error, '-y', 'LineWidth', 2);
xlabel('number of iteration');
ylabel('L2 norm');
title("error of A2 = b2 ")
%saveas(gcf,'SOR_2.png')
legend('Jacobi','Gauss-seidel', 'SOR')
%%

