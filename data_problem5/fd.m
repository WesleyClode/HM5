function [rate] = fd(sigma,index)
%FD �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
sum_up = sum(sigma(index+1:length(sigma)));
sum_sigma = sum(sigma);
rate = sum_up/sum_sigma;
end

