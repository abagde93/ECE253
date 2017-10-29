%Problem 1: Adaptive Histogram Equalization

%function enhanced_image = AHE(input_image,win_size)

%Pad input image based on window size, so conextual region for edge pixels
%remains valid. Window size in always MxM, where M is odd.

%Window will always be contered on pixel of interest. This means that the
%padding on each size has to be exactly (M-1)/2

clear;
clc;

input_image = imread('airplane_gray.png');
win_size = 15;

pad = (win_size -1)/2;
padded_image = padarray(input_image,[pad pad],'symmetric');

[rows,cols] = size(input_image);

%Allocate enhanced_image matrix
enhanced_image = zeros(rows,cols);

for x=1:rows
    for y=1:cols
        rank = 0;
        
        %current pixel in terms of the padded matrix(offset)
        current_pixel = padded_image(x+pad,y+pad);
        
        for i = -pad:1:pad
            for j = -pad:1:pad
                if padded_image(x+pad+i,y+pad+j) > current_pixel
                    rank = rank+1;
                end
            end
        end
        output_pixel = rank*255/(win_size*win_size);
        enhanced_image(x,y) = output_pixel;
    end
end

test_image = adapthisteq(input_image,'NumTiles',[win_size win_size]);
        
subplot(1,3,1)
imshow(input_image)
title('original image')
subplot(1,3,2)
imshow(enhanced_image, [])
title('enhanced image')
subplot(1,3,3)
imshow(test_image)
title('test image')


                
                
                
                
                
        