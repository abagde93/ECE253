%Problem 3: K-means Segmentation

clear;
clc;

input_image = double(imread('white-tower.png'));
feature_matrix = createDataset(input_image);

%Initialize cluster centers for K-means
nclusters = 7;

rng(5);
id = randi(size(feature_matrix, 1), 1, nclusters);
centers = feature_matrix(id,:)

%Peform the K-means algorithm
[idx, centers] = kMeansCluster(feature_matrix, centers);
centers