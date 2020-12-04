function [x_new] = soft_thresholding(x, sigma)
%%
%SOFT_THRESHOLDING soft-thresholding operator and is defined as follows: 
%if z = soft(x, ¦Ò), then z_i = sign(x_i) max{|x_i| ? ¦Ò, 0}.
%
x_new = sign(x).*max(abs(x)-sigma, 0);
end

