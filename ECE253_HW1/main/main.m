%main.m
%This will call all the other .m files for problems 1-4

%Executing script for problem 1
prob1

%Executing script for problem 2
prob2

%calling MATLAB function for problem 3
img = imread('geisel.jpg');
figure
compute_norm_rgb_histogram(img)

%calling MATLAB function for problem 4
figure
chroma_keying('dog.jpg',[130,100,200],'beach.jpg')
figure
chroma_keying('travolta.jpg',[130,100,200],'ocean.jpg')

