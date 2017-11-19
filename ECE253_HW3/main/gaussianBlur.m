function blurred_image = gaussianBlur(im_in,sigma)

[rows,cols] = size(im_in);

kernel = 6*sigma;
%Pad input image based on kernel size, so conextual region for edge pixels
%remains valid. Kernel size in always MxM

%Kernel will always be contered on pixel of interest. This means that the
%padding on each size has to be exactly (M-1)/2


pad = floor((kernel-1)/2);
padded_image = padarray(im_in,[pad pad],'symmetric');

%[rows,cols] = size(padded_image)

%Now lets actually create the Guassian Filter
%Of Form: h = fspecial('gaussian',hsize,sigma)
h = fspecial('gaussian',kernel,sigma);
blurred_image = imfilter(padded_image,h);

%imfilter automatically zero-pads the image, so its needs to be cropped
%to return to original size
blurred_image = imcrop(blurred_image,[pad pad cols-1 rows-1]);


