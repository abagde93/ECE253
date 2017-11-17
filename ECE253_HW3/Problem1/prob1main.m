%Problem 1: Blurring and Sharpening

clear;
clc;

%i)Using the guassianBlur() function
img = imread('brain.tif');
img = single(img);

blur_image = gaussianBlur(img,2);
%imshow(uint8(blur_image))

%ii)Using the blurOrSharpen() function
blur_sharpen_img = blurOrSharpen(img,10,-1);
%figure
%imshow(uint8(blur_sharpen_img))

%iii)Using the gaussianUnblur function - input to this is the blurred image
%created in part i
[output,mse_residuals,mse_original] = gaussianUnblur(blur_sharpen_img,10,100,3);

subplot(2,2,1)
imshow(uint8(img))
title('original image')
subplot(2,2,2)
imshow(uint8(blur_image))
title('blurred image')
subplot(2,2,3)
imshow(uint8(blur_sharpen_img))
title('blurred/sharpened image')
subplot(2,2,4)
imshow(uint8(output))
title('shaprpened image')

figure
plot(mse_residuals)
title('MSE - residuals')
ylabel('MSE')

hold on
plot(mse_original)
title('MSE - original')
ylabel('MSE')
