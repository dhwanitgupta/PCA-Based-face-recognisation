[fvector,evectors,mean_img,img_set,num_imgs,images] = face_detection(30);
test_img = input('Enter the image name to compare ','s');

timg = imresize(imread(test_img),[80,80]);
%for i = 1:num_imgs
%timg = img_set(:,i);
%timg = reshape(timg,[80,80]);
timg = rgb2gray(timg);
imgvec = timg(:);
shifted_ip_img = double(imgvec) - mean_img;
fvec = evectors' * shifted_ip_img;

[d,num_imgs] = size(img_set);
diff = zeros(num_imgs,1);
for j = 1 : num_imgs
    diff(j,1) = 1/(1 + norm(fvector(:,j) - fvec));
end
[maxval,index] = max(diff);
%[recon_img] = reconstruct(evectors,fvec,mean_img);
figure,subplot(1,2,1),imshow(uint8(timg)),title('Input Image');
subplot(1,2,2),imshow(uint8(reshape(img_set(:,index),[80,80]))),title(strcat('Matched Image with score ' ,num2str(maxval)));
%end