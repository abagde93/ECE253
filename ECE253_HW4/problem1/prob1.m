%Problem 1: Canny Edge Detetction

clc;
clear;

image = imread('geisel.jpg');
image = rgb2gray(image);

canny_edge(image, .00001);