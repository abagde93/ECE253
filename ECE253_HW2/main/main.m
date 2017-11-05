%main.m
%This will call all the other .m files for problems 1-4

%Executing script for problem 1
beach = imread('beach.png');
AHE(beach,33)
figure
AHE(beach,65)
figure
AHE(beach,129)



%Executing script for problem 2
figure
prob2

%calling MATLAB function for problem 3
diver = imread('diver.tif');
figure
QUANT_MSE(diver)
diver = histeq(diver,256);
figure
QUANT_MSE(diver)

lena = imread('lena512.tif');
figure
QUANT_MSE(lena)
lena = histeq(lena,256);
figure
QUANT_MSE(lena)