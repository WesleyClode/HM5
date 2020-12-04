function [x] = update(x0,A,b)
%UPDATE 此处显示有关此函数的摘要
%   此处显示详细说明
x = zeros(length(b),1);
for i=1:length(b)
    for j=1:length(b)
        if j~=i
            
        end
    end
    x(i) = 1/A(i,i)*(b(i) - sum)
end
end

    for i=1:n
        xi=0;
        for j=1:n
            if i~=j
                xi=xi+A(i,j)*C(j);
        C(i)=(b(i)-xi)/A(i,i);      
            end
         end
    end