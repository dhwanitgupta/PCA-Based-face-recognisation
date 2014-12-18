function [f_vector,evectors,mean_img,img_set,num_imgs,images] = face_detection(d)
timage = ls('train');
images = timage(3:size(timage,1),:);
[num_imgs,len] = size(images);
%num = input('Enter number of eigen vector to use : ');

for i = 1:num_imgs
    img = imread(strcat('train/',images(i,:)));
    siz = size(img);
    [pp,qq] = size(siz);
    if qq == 3
        img = rgb2gray(img);
    end
    img = imresize(img,[80,80]);
    if i == 1
        [n,m] = size(img);
        img_set = zeros(n*m,num_imgs);  
    end
    img_set(:,i) = img(:);
end
img_dims = [n,m];
mean_img = mean(img_set,2);

for i = 1:num_imgs
    shifted_images(:,i) = img_set(:,i)  - mean_img(:);
end

[evectors, score, evalues] = princomp(img_set');

evectors = evectors(:,1:d);
f_vector = evectors' * shifted_images;
end
