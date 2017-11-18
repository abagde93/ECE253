%Problem 1: Blurring and Sharpening

clear;
clc;

%i)Using the guassianBlur() function
img = imread('brain.tif');
img = single(img);

blur_image = gaussianBlur(img,2);
%imshow(uint8(blur_image))

%ii)Using the blurOrSharpen() function
blur_sharpen_img = blurOrSharpen(img,2,1);
%figure
%imshow(uint8(blur_sharpen_img))

%iii)Using the gaussianUnblur function - input to this is the blurred image
%created in part i
[output,mse_residuals,mse_original] = gaussianUnblur(blur_image,2,10,.0001);
%scale mse_original
current_max = max(mse_original);
current_min = min(mse_original);
mse_original = ((mse_original-current_min)*(255))/(current_max-current_min);

%part b)
im_noisy = single(imnoise(uint8(blur_image), 'gaussian'));
[output_noisy,mse_residuals,mse_original] = gaussianUnblur(im_noisy,2,10,.0001);

subplot(2,3,1)
imshow(uint8(img))
title('original image')
subplot(2,3,2)
imshow(uint8(blur_image))
title('blurred image')
subplot(2,3,3)
imshow(uint8(blur_sharpen_img))
title('blurred/sharpened image')
subplot(2,3,4)
imshow(uint8(output))
title('shaprpened image')
subplot(2,3,5)
imshow(uint8(output_noisy))
title('shaprpened image w/noise')

figure
plot(mse_residuals)
title('MSE - residuals')
ylabel('MSE')

hold on
plot(mse_original)
title('MSE - original')
ylabel('MSE')

