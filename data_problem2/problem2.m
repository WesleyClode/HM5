clc;
clear;
%% 2.1
A = [0 1 0 0
    0 0 2 0
    0 0 0 3
    1/6000 0 0 0];

[V,D] = eig(A);

[u_A, s_A, v_A] = svd(A);
%% 2,2
B = [3 2
    1 4
    0.5 0.5];

[u_B, s_B, v_B] = svd(B);
[u_B1, s_B1, v_B1] = SVD_ATA(B);
%% 2.3
xx1 = zeros(30,1);
xx2 = zeros(30,1);
for i=1:30
    A = generateA(i);
    xx1(i) = min(svd(A));
    
    temp = zeros(length(A(1,:)),1);
    [U2, S2, V2] = SVD_ATA(A);
    for j=1:length(A(1,:))
        temp(j) = S2(j,j);
    end
    xx2(i) = min(temp);
end

% Plot the convergence graph
figure;
plot(1:numel(xx1), log(xx1), '-g', 'LineWidth', 2);
hold on

plot(1:numel(xx2), log(xx2), '-b', 'LineWidth', 2);
legend('svd','svdATA')
xlabel('m');
ylabel('log(smallest singular value)');
title("the smallest singular value ");
hold off