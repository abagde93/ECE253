function blur_sharp_image = blurOrSharpen(im_in,sigma,w)

%We are implementing the following function
%I' = (1 + w) x I - w x I * G_sigma
%I * G_sigma convolution has already been done in the gaussianBlur()
%function , so we can use that

conv = gaussianBlur(im_in,sigma);

%Now we have the following operation:
%I' = (1 + w) x I - w x conv
blur_sharp_image = (1+w)*im_in-(w*conv);
