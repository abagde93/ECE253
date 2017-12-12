function [hough_matrix,rho_range,theta] = hough_transform(input_img)
 
    %Get parameters for theta-rho plane, the hough matrix essentially
    input_img = flipud(input_img);
    [l,w] = size(input_img);
    %D is the maximimum distance bewteen corners in the image
    D = (l^2 + w^2)^.5;
    rho_range = (-D:1:D);
    
    %theta is between -90 and 90 deg
    theta = (-pi/2:pi/180:pi/2);
    
    num_thetas = numel(theta);
    num_rhos = numel(rho_range);
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
                    rho = i*cos(theta(k)) + j*sin(theta(k));
                    rho = round(rho + num_rhos/2);    
                    if rho ~= 0
                        hough_matrix(rho, k) = hough_matrix(rho, k) + 1;
                    end
                end
            end
        end
    end

    
    imagesc(theta,rho_range,hough_matrix)
    
    
 
end