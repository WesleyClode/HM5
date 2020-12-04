function [U, S, V] = SVD_ATA(B)
%SVD_ATA SVD Decomposition by ATA
%Input : Thin matrix A
% [U, S, V] = svd(B)
%  B = U*S*V'
%
% [V, D] = eig(M)
%  A*V = V*D.

% [Q1, R1] = qr(A)
%  Q1 * R1 = A
%%
M = B'*B;
[V, D] = eig(M);  %
[d,ind] = sort(diag(D),'descend');
%特征值分解 按照从大到小的顺序排列
%但有个问题就是D要开平方 ，对应的正负号的信息会丢失，V的正负号需要后面重新考虑
D = sqrt(D);
S = zeros(length(B(:,1)),length(B(1,:)));
for i=1:length(ind)
    S(i,i) = D(ind(i),ind(i));
end
V = V(:,ind);%这里的V少第一列的负号 不对的
[U, S_1] = qr(B*V);
V = V * S_1(1,1)/S(1,1);
end
