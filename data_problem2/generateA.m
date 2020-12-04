function [C] = generateA(m)
%GENERATEA 
A = ones(m);
C = triu(A);
for i = 1:length(A)
    C(i,i) = 0.1;
end

end

