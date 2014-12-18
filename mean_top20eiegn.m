[fvector,evectors,mean_img,img_set,num_imgs] = face_detection(200);
mean_img = uint8(reshape(mean_img,[80,80]));
h = figure;
%title('Top 20 Eigen Vector Images');
for i = 1:20
evec = evectors(:,i);
evec = reshape(evec,[80,80]);
emin = min(min(evec));
evec(:,:) = evec(:,:) + abs(emin);
emax = max(max(evec));
evec = evec .* (255/emax);
%subplot(1,2,1),imshow(uint8(mean_img)),title('MEAN IMAGE');
subplot(4,5,i),imshow(uint8(evec));
end

saveas(h,'nagQ2.jpg');
