function [maximum, row, col] = search(img, template)
   
    %img = uint8(img);
    
    %Compute normalized cross-correlation of matrices template and img
    correlation = conv2(template, img);
    
    %Take care of padding
    rowOffset = size(correlation,1) - size(img,1);
    colOffset = size(correlation,2) - size(img,2);
    
    m1 = floor(rowOffset/2);
    n1 = floor(colOffset/2);
    m2 = ceil(rowOffset/2);
    n2 = ceil(colOffset/2);
    
    correlation(1:m2,:) = [];
    correlation(end-m1+1:end,:) = [];
    correlation(:,1:n2) = [];
    correlation(:,end-n1+1:end) = [];
    
    
    %Find maximum value in correlation matrix and its coordinates
    maximum = max(correlation(:));
    [row, col] = find(correlation == max(correlation(:)))
    
end
