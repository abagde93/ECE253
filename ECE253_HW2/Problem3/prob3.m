%Problem 3 - Lloyd-Max Quantizer

clear;
clc;

%%Part1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Read in uint8 greayscale images
diver = imread('diver.tif');
lena = imread('lena512.tif');

%Use myQuantize function on above images
diver_quantized = myQuantize(diver, 7);
lena_quantized = myQuantize(lena, 7);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Part2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Reshape image in order to perform Lloyd-Max quantizing
[M,N] = size(diver);
training_set = reshape(diver,N*M,1);
%len = 4
%[partition, codebook] = lloyds(training_set,len);

for s = 1:1:5
      len = 2.^s;
      training_set = double(training_set);
      [partition, codebook] = lloyds(training_set, len);
      [diver_lloyd ,index] = quantiz(training_set,partition,codebook);
      diver_lloyd = (diver_lloyd/len)*255;
      diver_lloyd = reshape(diver_lloyd,[M,N]);
end
imshow(uint8(diver_lloyd))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%