%Problem 2 - Binary Morphology
clc;
clear;

%Part1
cl = imread('lines.jpg');
cl = im2bw(cl);

%First step is to remove lines from the image
se = strel('line',8,90);
cl_open = imopen(cl, se);

subplot(1,2,1)
imshow(cl)
subplot(1,2,2)
imshow(cl_open)

%Now do the connected component labeling
%We get 30, which is the number of circles
labels = bwlabel(cl_open,4);

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
    
    %fprintf('Component %d centroid located at:\n',x)
    %fprintf('%f, %f\n', [cent_row,cent_col]')
end
    
    

s = regionprops(labels ,'area');
centroids = cat(1, s.Area)
%test = bwconncomp(labels)



