function [idx, centers] = kMeansCluster(features, centers)
[row,col] = size(features);
[center_number,~] = size(centers);

idx = zeros(row,1);

max_iter = 200;
counter = 0;
while(counter < max_iter)
    
    %Assign each data point to its nearest center
     distance_array = pdist2(features(:,:),centers(:,:));
    [~,nearest_center] = min(distance_array,[],2);
    idx = nearest_center;
    
    %Now recompute the centers - assign data points to their corresponding
    %center. And recompute the center means
    centers = zeros(center_number,3);
    
    for i = 1:center_number
        indices = find(idx(:) == i);
        center_average = features((indices),:);
        centers(i,:) = mean(center_average);   
    end
        
    
            
    counter = counter + 1;        
            
end
end



