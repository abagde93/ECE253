%Problem 4: Chroma Keying

function [] = chroma_keying(input_image, mask_params, background_image)

%First read in input and background images
input_img = imread(input_image);
img_background = imread(background_image);


%Process input image. Get histograms for individual RGB channels
%This way we can set thresholds for the mask

input_img_R = input_img(:,:,1);
input_img_G = input_img(:,:,2);
input_img_B = input_img(:,:,3);

%Binary image showing foreground mask
mask = (input_img(:,:,1) < mask_params(1)) & (input_img(:,:,2) > mask_params(2)) & (input_img(:,:,3) < mask_params(3));
mask = imcomplement(mask);
binary_mask = uint8(mask);

%Use mask on original image, get RGB image on black background
original_foreground(:,:,1) = input_img(:,:,1).*binary_mask;
original_foreground(:,:,2) = input_img(:,:,2).*binary_mask;
original_foreground(:,:,3) = input_img(:,:,3).*binary_mask;

%Now place RGB image on another background
new_background(:,:,1) = original_foreground(:,:,1) + img_background(:,:,1).*(1-binary_mask);
new_background(:,:,2) = original_foreground(:,:,2) + img_background(:,:,2).*(1-binary_mask);
new_background(:,:,3) = original_foreground(:,:,3) + img_background(:,:,3).*(1-binary_mask);


subplot(2,3,1)
imhist(input_img_R)
title('red histogram')
subplot(2,3,2)
imhist(input_img_G)
title('green histogram')
subplot(2,3,3)
imhist(input_img_B)
title('blue histogram')
subplot(2,3,4)
imshow(mask)
title('Binary Mask(i)')
subplot(2,3,5)
imshow(original_foreground)
title('Foreground(ii)')
subplot(2,3,6)
imshow(new_background)
title('Foreground on New Background(iii)')




