%Problem 2: Hough Transform

clc;
clear;
close all;

%Part 1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Implemented hough_transform function

%Part 2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Produce test image
test_image = zeros(11,11);
test_image(1,1) = 1;
test_image(1,11) = 1;
test_image(6,6) = 1;
test_image(11,1) = 1;
test_image(11,11) = 1;

% test_image = zeros(101,101);
% test_image(1,1) = 1;
% test_image(1,101) = 1;
% test_image(51,51) = 1;
% test_image(101,1) = 1;
% test_image(101,101) = 1;


[hough_matrix,rho_values,theta_values] = hough_transform(test_image);

figure
imshow(test_image,'InitialMagnification',1000)
hold on;
[l,w] = size(hough_matrix);
[rows,cols] = size(test_image);
threshold = 3;
for i=1:l
    for j=1:w
        if hough_matrix(i,j) >= threshold
            theta = theta_values(j);
            rho = rho_values(i);
            
            m = -(cos(theta)/sin(theta));
            b = rho/sin(theta);
            x = 1:cols;
            y = m*x+b;
            plot(x, y);
            hold on;
        
        end
    end
end



