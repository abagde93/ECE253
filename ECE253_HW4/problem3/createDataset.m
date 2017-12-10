function [features] = createDataset(im)

reshaped_image = reshape(im,1,[],3);
features = reshape(reshaped_image,[],3);

end