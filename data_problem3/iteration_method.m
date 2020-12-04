function [x] = iteration_method(x0,max_iter, eps, method,A,b)
%ITERATION_METHOD 此处显示有关此函数的摘要
%   x0:strating point
%   max_iter:maximum iterations N
%   eps:error bound
x = x0;
N = max_iter;

for i=1:N
    x_old = x;
    if method == "jacobi"
        x = update_jacobi(x);
    elseif method == "Gauss-Seidel"
        x = update_Gauss(x);
    elseif method == "SOR"
        x = update_SOR(x);
    end
    if norm(x-x_old) < eps
        break;
    end
end

end

