function [im_seg] = mapValues(im,idx)

%reshaped idx to frame of original image
[l,w,h] = size(im)

reshaped_idx = reshape(idx, l,w);
size(reshaped_idx)

im_seg = zeros(l,w,h);


%Now calculate the cluster centers again, just like in kMeansCluster
%Manually define center number as 7
center_number = 7;
reshaped_image = reshape(im,1,[],3);
features = reshape(reshaped_image,[],3);

centers = zeros(center_number,3);
for i = 1:center_number
    indices = find(idx(:) == i);
    center_average = features((indices),:);
    centers(i,:) = mean(center_average);   
end

for i = 1:l
    for j = 1:w
        for k = 1:center_number
            if reshaped_idx(i,j) == k
                im_seg(i,j,:) = centers(k,:);
            end
        end
    end
end
