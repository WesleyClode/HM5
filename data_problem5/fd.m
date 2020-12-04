function [rate] = fd(sigma,index)
%FD 此处显示有关此函数的摘要
%   此处显示详细说明
sum_up = sum(sigma(index+1:length(sigma)));
sum_sigma = sum(sigma);
rate = sum_up/sum_sigma;
end

