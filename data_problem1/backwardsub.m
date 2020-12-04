function x = backwardsub(a,b)
% x = forsub(a,b) computes the solution of an lower triangular
% system a*x = b using forward-substitution
%
% inputs
% ------
% a: an n x n upper triangular matrix
% b: an n x 1 column vector
%
% outputs
% -------
% x: the n x 1 solution to the system a*x = b
%
% notes
% -----
% the matrix a need not actually be lower triangular, but only
% the lower triangular part is used
%
% examples
% --------
% x = forwardsub(triu(magic(3)),ones(3,1))

n = length(b);
x = zeros(n,1);

for i = n:-1:1
    x(i) = b(i);
    for j = i+1:n                   
        x(i) = x(i) - a(i,j)*x(j);
    end
    x(i) = x(i)/a(i,i);
end

end