%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');
%% Load Data

filename1 = 'data_problem4/data1/data1.mat';
face1 = importdata(filename1);
[mu, u, singular, u_d] = PCA_svd(face1, 10);
mu_image = reshape(mu,[48,42]);
colorbar

%% eigenface
colormap gray
x = double(face1);
[mu, u, singular, u_d] = PCA_svd(x, 10);
set(gcf,'unit','normalized','position',[0.2,0.2,1.3,0.25]);  

ax1 = subplot(1,5,1); % top subplot
imagesc(reshape(mu_image,48, 42));
title(ax1,'Mean face')

ax2 = subplot(1,5,2); % bottom subplot
imagesc(reshape(u(:, 1),48, 42))
title(ax2,'first eigenface')

ax3 = subplot(1,5,3); % bottom subplot
imagesc(reshape(u(:, 2),48, 42))
title(ax3,'second eigenface')

ax4 = subplot(1,5,4); % bottom subplot
imagesc(reshape(u(:, 3),48, 42))
title(ax4,'third eigenface')

ax5 = subplot(1,5,5); % bottom subplot
imagesc(reshape(u(:, 10),48, 42))
title(ax5,'tenth eigenface')

%%
% Apply PCA in Algorithm 3 with d = 10 to the Training Set.
%% ������ȡ�ļ�
file_path = './training_images/';% ͼ���ļ���·��
img_path_list = dir(strcat(file_path,'*.pgm'));%��ȡ���ļ���������jpg��ʽbai��ͼ��
img_num = length(img_path_list);%��ȡͼ��������
data_train = zeros(2016,img_num);
if img_num > 0 %������������ͼ��
    for j = 1:img_num %��һ��ȡͼ��
    image_name = img_path_list(j).name;% ͼ����
    image = imread(strcat(file_path,image_name));
    data_train(:,j) = reshape(image, 2016, 1);
    fprintf('%d %d %s\n',j,strcat(file_path,image_name));% ��ʾ���ڴ����ͼ����
    end
end
%%
[mu10, u, singular, u_d] = PCA_svd(data_train, 10);
figure;
set(gcf,'unit','normalized','position',[0.2,0.2,1.3,0.25]); 

ax1 = subplot(1,5,1); % top subplot
imagesc(reshape(mu10,48, 42));
title(ax1,'Mean face')

ax2 = subplot(1,5,2); % bottom subplot
imagesc(reshape(u(:, 1),48, 42))
title(ax2,'first eigenface')

ax3 = subplot(1,5,3); % bottom subplot
imagesc(reshape(u(:, 2),48, 42))
title(ax3,'second eigenface')

ax4 = subplot(1,5,4); % bottom subplot
imagesc(reshape(u(:, 3),48, 42))
title(ax4,'third eigenface')

ax5 = subplot(1,5,5); % bottom subplot
imagesc(reshape(u(:, 10),48, 42))
title(ax5,'tenth eigenface')


[mu2, u, singular, u_d] = PCA_svd(data_train, 2);

figure;
set(gcf,'unit','normalized','position',[0.2,0.2,1.3,0.25]); 

ax1 = subplot(1,5,1); % top subplot
imagesc(reshape(mu2,48, 42));
title(ax1,'Mean face')

ax2 = subplot(1,5,2); % bottom subplot
imagesc(reshape(u(:, 1),48, 42))
title(ax2,'first eigenface')

ax3 = subplot(1,5,3); % bottom subplot
imagesc(reshape(u(:, 2),48, 42))
title(ax3,'second eigenface')

ax4 = subplot(1,5,4); % bottom subplot
imagesc(reshape(u(:, 3),48, 42))
title(ax4,'third eigenface')

ax5 = subplot(1,5,5); % bottom subplot
imagesc(reshape(u(:, 10),48, 42))
title(ax5,'tenth eigenface')

%% plot singular value
all_data = load('all_data.mat');
data_train = all_data.data_train;
figure;
y = data_train-repmat(mean(data_train,2),1,40);
%repmat(mu,1,40)
singular = svd(y);

plot((1:numel(singular)), singular, '-b', 'LineWidth', 2);
xlabel('number');
ylabel('singular value');
title("Plot the sorted singular values")
saveas(gcf,'singular_value.png')

%% project the test set onto the face subspace
% file_path = './test_images/';% ͼ���ļ���·��
% img_path_list = dir(strcat(file_path,'*.pgm'));%��ȡ���ļ���������jpg��ʽbai��ͼ��
% img_num = length(img_path_list);%��ȡͼ��������
% data_test = zeros(2016,img_num);
% if img_num > 0 %������������ͼ��
%     for j = 1:img_num %��һ��ȡͼ��
%     image_name = img_path_list(j).name;% ͼ����
%     image = imread(strcat(file_path,image_name));
%     data_test(:,j) = reshape(image, 2016, 1);
%     fprintf('%d %d %s\n',j,strcat(file_path,image_name));% ��ʾ���ڴ����ͼ����
%     end
% end
data_test = all_data.data_test;
x_test = double(data_test);
x_image10 = zeros(20,2016);
x_image2 = zeros(20,2016);


%% ͶӰ��d=10
[mu10, u, singular, u_d10] = PCA_svd(data_train, 10);
for i = 1:20
    x_image10(i,:) = (data_test(:,i) - mu10)' * u_d10 * u_d10' + mu10';
end

figure;
set(gcf,'unit','normalized','position',[0.3,0.3,1.3,0.4]); 

ax1 = subplot(1, 4, 1);
imagesc(reshape(x_image10(1,:),48, 42));
title("indiviual 1");
ax2 = subplot(1, 4, 2);

imagesc(reshape(x_image10(6,:),48, 42));
title(ax2, "indiviual 2");
ax3 = subplot(1, 4, 3);

imagesc(reshape(x_image10(11,:),48, 42));
title(ax3, "indiviual 3");
ax4 = subplot(1, 4, 4);

imagesc(reshape(x_image10(16,:),48, 42));
title(ax4, "indiviual 4");
%% ͶӰ��d=2
[mu2, u, singular, u_d2] = PCA_svd(data_train, 2);
for i = 1:20
    x_image10(i,:) = (data_test(:,i) - mu2)' * u_d2 * u_d2' + mu2';
end

figure;
set(gcf,'unit','normalized','position',[0.3,0.3,1.3,0.4]); 

ax1 = subplot(1, 4, 1);
imagesc(reshape(x_image2(1,:),48, 42));
title("indiviual 1");
ax2 = subplot(1, 4, 2);

imagesc(reshape(x_image2(6,:),48, 42));
title(ax2, "indiviual 2");
ax3 = subplot(1, 4, 3);

imagesc(reshape(x_image2(11,:),48, 42));
title(ax3, "indiviual 3");
ax4 = subplot(1, 4, 4);

imagesc(reshape(x_image2(16,:),48, 42));
title(ax4, "indiviual 4");
