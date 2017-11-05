%Problem 2 - Binary Morphology
clc;
clear;

%Part1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cl = imread('circles_lines.jpg');
cl = im2bw(cl);

%First step is to remove lines from the image
se = strel('disk',5);
cl_open = imopen(cl, se);

subplot(2,3,1)
imshow(cl)
title('original image')
subplot(2,3,2)
imshow(cl_open)
title('image after opening')

%Now do the connected component labeling
%We get 30, which is the number of circles
labels = bwlabel(cl_open,4);
labels1 = labels;
subplot(2,3,3)
imagesc(labels)
title('connected component labeling')



%Find number of connected components
number_components = max(max(labels));

%Now find info on each component
for x = 1:number_components
    
    %Find all rows/columns that contain an element of the component
    [row, col] = find(labels==x);
    
    %Area is just instances of that component in the overall matrix
    fprintf('Area of component %d is: %d\n',x,length(row))
    
    %Find dimensions of bounding box that contains the component
    min_row = min(row);
    max_row = max(row);
    min_col = min(col);
    max_col = max(col);
    
    cent_row = (max_row + min_row)/2;
    cent_col = (max_col + min_col)/2;
    
    fprintf('Component %d centroid located at:\n',x)
    fprintf('%f, %f\n', [cent_row,cent_col]')
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Part2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cl = imread('lines.jpg');
cl = im2bw(cl);

%First step is to remove lines from the image
se = strel('line',8,90);
cl_open = imopen(cl, se);

subplot(2,3,4)
imshow(cl)
title('original image')
subplot(2,3,5)
imshow(cl_open)
title('image after opening')

%Now do the connected component labeling
%We get 30, which is the number of circles
labels = bwlabel(cl_open,4);
labels2 = labels;
subplot(2,3,6)
imagesc(labels)
title('connected component labeling')

%Find number of connected components
number_components = max(max(labels));

%Now find info on each component
for x = 1:number_components
    
    %Find all rows/columns that contain an element of the component
    [row, col] = find(labels==x);
    
    
    %Find dimensions of bounding box that contains the component
    min_row = min(row);
    max_row = max(row);
    min_col = min(col);
    max_col = max(col);
    
    cent_row = (max_row + min_row)/2;
    cent_col = (max_col + min_col)/2;
    
    %Length is just max_row-min_row
    fprintf('Length of component %d is: %d\n',x,max_row-min_row)
    
    
    fprintf('Component %d centroid located at:\n',x)
    fprintf('%f, %f\n', [cent_row,cent_col]')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
figure
imagesc(labels1)

figure
imagesc(labels2)



