%Problem 2: Simple image manipulation
clear;
clc;

%(i) Download any color image from the Internet with a spatial resolution of no more than (720
%X 480). Read this image into MATLAB. Call this image A.
A = imread('JAL.jpg');

%(ii) Transform the color image to grey-scale. Verify the values are between 0 and 255. If not,
%please normalize your image from 0 to 255. Call this image B.
B = rgb2gray(A);

%(iii) Add 20 to each value of image B. Set all pixel values greater than 255 to 255. Call this image
%C.
C = B + 20;
C(C > 255) = 255;

%(iv) Flip image B along both the horizontal and vertical axis. Call this image D.
%end:-1:1 - reverses order of elements in an array/matrix
%B(:,end:-1:1) is a horizontal flip
%B(end:-1:1,:) is a vertical flip
%If we were dealing with a RGB image, we would use (:,end:-1:1,:),etc
D = B(end:-1:1,end:-1:1);

%(v) Calculate the median of all values in image B. Next, threshold image B by the median value
%you just calculated i.e. set all values greater than median to 1 and set all values less than or
%equal to the median to 0. Name this binary image E.
median_B = median(B(:));
E = B;
E(E <= median_B) = 0;
E(E > median_B) = 1;
E = logical(E);

%Show images in subplot
subplot(3,2,1)
imshow(A)
title('i')

subplot(3,2,2)
imshow(B)
title('ii')

subplot(3,2,3)
imshow(C)
title('iii')

subplot(3,2,4)
imshow(D)
title('iv')

subplot(3,2,5)
imshow(E)
title('v')

