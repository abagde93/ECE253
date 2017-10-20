%Problem 3: Histograms


function rgb_hist = compute_norm_rgb_histogram(input_image)

%First we have to read in the image
%We pass the function the image --> compute_norm_rgb_histogram(image_name)

%imshow(input_image)

%Now seperate image into individual RGB components
red = input_image(:,:,1);
green = input_image(:,:,2);
blue = input_image(:,:,3);

%convert to arrays to work with easier
red_array = reshape(red,1,[]);
green_array = reshape(green,1,[]);
blue_array = reshape(blue,1,[]);

%Now compute invidual histograms(5-bit, 32 bins)
red_hist = zeros(1,32);
green_hist = zeros(1,32);
blue_hist = zeros(1,32);

for bin = 1:32
    for x=1:length(red_array)       %All arrays are the same size
        t_min = (255/32)*(bin-1);
        t_max = (255/32)*(bin);
        if (red_array(x) <= t_max && red_array(x) >= t_min)
            red_hist(1,bin) = red_hist(1,bin) + 1;
        end
        if (green_array(x) <= t_max && green_array(x) >= t_min)
            green_hist(1,bin) = green_hist(1,bin) + 1;
        end
        if (blue_array(x) <= t_max && blue_array(x) >= t_min)
            blue_hist(1,bin) = blue_hist(1,bin) + 1;
        end
    end
end

%Concatenate histograms together and normalize
rgb_vector = cat(2,red_hist,green_hist,blue_hist);
rgb_hist = rgb_vector./sum(rgb_vector);


subplot(3,3,1)
imhist(red)
title('red imhist(testing)')
subplot(3,3,2)
imhist(green)
title('green imhist(testing)')
subplot(3,3,3)
imhist(blue)
title('blue imhist(testing)')

subplot(3,3,4)
x=(1:32)*8;
bar(x,red_hist)
xlim([0 255])
title('red')
subplot(3,3,5)
x=(1:32)*8;
bar(x,green_hist)
xlim([0 255])
title('green')
subplot(3,3,6)
x=(1:32)*8;
bar(x,blue_hist)
xlim([0 255])
title('blue')

subplot(3,3,8)
x=(1:96)*7.968;
bar(x,rgb_hist)
xlim([0 765])
title('RGB hist(FINAL ANSWER)')
xlabel('96 bins(32 each for R,G,B respectively)')
ylabel('normalized histogram')






