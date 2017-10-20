%%Problem 1: MATLAB Basics
clear;
clc;

A = [3 9 5 1;4 25 4 3;63 12 23 9;6 32 77 0;12 8 5 1];
B = [0 1 0 1;0 1 1 1;0 0 0 1;1 1 0 1;0 1 0 0];

%%(i) Point-wise multiply A with B and set it to C.
C = A.*B

%%(ii) Calculate the inner product of the 2nd and 5th row of C.
inner_product = dot(C(2,:),C(5,:))

%%Find the minimum and maximum values and their corresponding row and column indices in
%%matrix C. If there are multiple min/max values, you must list all their indices.

%To find max value in matrix
value = max(C(:));
%Now to find all instances of that value, and get indices
extrema = find(C(:) == value);
[row,col] = ind2sub(size(C),extrema);
fprintf('Maximum value is %d located at these location(s):\n',value)
fprintf('%d, %d\n', [row,col]')

%Same thing for min
value = min(C(:));
%Now to find all instances of that value, and get indices
extrema = find(C(:) == value);
[row,col] = ind2sub(size(C),extrema);
fprintf('Minimum value is %d located at these location(s):\n',value)
fprintf('%d, %d\n', [row,col]')


