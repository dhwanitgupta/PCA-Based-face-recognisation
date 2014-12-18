function [recon_img] = reconstruct(evectors,fvec,mean_img)

shifted_img = pinv(evectors')*fvec;
recon_img = shifted_img + mean_img;
end