[f_vector,evectors,mean_img,img_set,num_imgs,images] = face_detection(3);
p = ls('test');
[n,m] = size(p);
tr = 0;
fl = 0;
for i = 3:n
    timg = imresize(imread(strcat('test/',p(i,:))),[80,80]);
    imgvec = timg(:);
    shifted_ip_img = double(imgvec) - mean_img;
    fvec = evectors' * shifted_ip_img;
    diff = zeros(num_imgs,1);
    for j = 1 : num_imgs
        diff(j,1) = 1/(1 + norm(f_vector(:,j) - fvec));
    end
    [maxval,index] = max(diff);
    matchimg = images(index,:);
    bip = strtok(p(i,:),'_');
    bmp = strtok(matchimg,'_');
    if bmp == bip
        tr = tr + 1;
    else
        fl = fl + 1;
    end
    
end
Accuracy = tr/(tr+fl)
