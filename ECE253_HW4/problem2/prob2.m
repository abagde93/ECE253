%Problem 2: Hough Transform

clc;
clear;

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

input_img = test_image;
%Get parameters for theta-rho plane, the hough matrix essentially
    [l,w] = size(input_img);
    %D is the maximimum distance bewteen corners in the image
    D = (l^2 + w^2)^.5;
    rho = (-D:1:D);
    
    %theta is between -90 and 90 deg
    theta = (-pi/2:pi/180:pi/2);
    
    num_thetas = numel(theta);
    num_rhos = numel(rho);
    hough_matrix = zeros(num_rhos,num_thetas);
    
    %We only want to perform operation on "edge pixels", ie non-background
    %points
    
    %For every non-background point in the xy plane, we let theta equal
    %each of the allowed subdivisions on the theta-axis and solve for the
    %corresponding rho using equation rho = xcos(theta) + ysin(theta),
    %where rho is rounded to the nearest cell value
    
    %If a value of theta results in solution rho, increment the accumulator
    %matrix. The value in each bin represents how many points lie on a
    %certain line
    
    
    for i = 1:l
        for j = 1:w
            if input_img(i,j) == 1
                for k = 1:num_thetas
                    rho_calc = i*cos(theta(k)) + j*sin(theta(k));
                    rho_calc = round(rho_calc + num_rhos/2);    
                    if rho_calc ~= 0
                        hough_matrix(rho_calc, k) = hough_matrix(rho_calc, k) + 1;
                    end
                end
            end
        end
    end

%[hough_matrix] = hough_transform(test_image);

% [l,w] = size(hough_matrix);
% for i=1:l-1
%     for j=1:w-1
%         if hough_matrix(i,j) > 2
%             hough_matrix(i,j) = hough_matrix(i,j);
%         else
%             hough_matrix(i,j) = 0;
%         end
%     end
% end

