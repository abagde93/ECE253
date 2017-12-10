function [hough_matrix] = hough_transform(input_img)
 
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
                    rho = i*cos(theta(k)) + j*sin(theta(k));
                    rho = round(rho + num_rhos/2);    
                    if rho ~= 0
                        hough_matrix(rho, k) = hough_matrix(rho, k) + 1;
                    end
                end
            end
        end
    end

    
    imshow(hough_matrix)
    
    
    
    
    
    
    
    
    
    
    
    
    %     %Find all '1' pixels in input image
%     [x_info, y_info] = find(input_img);
%  
%     %Preallocate space for the accumulator array
%     edge_pixels = numel(x_info);
%     accumulator = zeros(edge_pixels,numel(theta));
%  
% 
%     cosine = (0:l-1)'*cos(theta); 
%     sine = (0:w-1)'*sin(theta); 
%     
%     %populate rho with proper values
%     accumulator((1:edge_pixels),:) = cosine(x_info,:) + sine(y_info,:);
%  
%     %Scan over the thetas and bin the rhos 
%     for i = (1:numel(theta))
%         hough_matrix(:,i) = hist(accumulator(:,i),rho);
%     end

 
end