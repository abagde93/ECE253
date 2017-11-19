%Problem 3: Template Matching

clear;
clc;

%part i
img = imread('Letters.jpg');
img = double(img);
template = imread('LettersTemplate.jpg');
template = double(template);

%template_flip = flipdim(template,2);
template_flip = flipud(template);
template_flip = fliplr(template_flip);
C = conv2(template_flip, img);
imshow(C,[])
colorbar;
title('Cross Correlation(Letters) - spatial')


img_fft = fft2(img);
template_fft = padarray(template_flip, size(img_fft)-size(template),'post');
template_fft = fft2(template_fft);
test = img_fft .* (template_fft);
test = ifft2(test);
figure
imshow(test,[])
colorbar;
title('Cross Correlation(Letters) - frequency')

%part ii
img = imread('StopSign.jpg');
img = rgb2gray(img);
img = double(img);
template = imread('StopSignTemplate.jpg');
template = rgb2gray(template);
template = double(template);

template_flip = flipud(template);
template_flip = fliplr(template_flip);
C = conv2(template_flip, img);
figure
imshow(C,[])
colorbar;
title('Cross Correlation(StopSign) - spatial')


img_fft = fft2(img);
template_fft = padarray(template_flip, size(img_fft)-size(template),'post');
template_fft = fft2(template_fft);
test = img_fft .* (template_fft);
test = ifft2(test);
figure
imshow(test,[])
colorbar;
title('Cross Correlation(StopSign) - frequency')


%iii) Normalized Cross Correlation
ncc = normxcorr2(template,img);
figure
imshow(ncc)
colorbar;
[ypeak, xpeak] = find(ncc==max(ncc(:)));
yoffSet = ypeak-size(template,1);
xoffSet = xpeak-size(template,2);

figure
imshow(img,[]);
colorbar;
imrect(gca, [xoffSet+1, yoffSet+1, size(template,2), size(template,1)]);

