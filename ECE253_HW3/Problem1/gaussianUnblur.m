function [I_k,MSE_residuals,MSE_orig] = gaussianUnblur(im_in,sigma,max_iter,t)

%I_0 is blurry input image
%I_k is the corrected image at iteration k
%G_sigma as defined in part i)

I_0 = im_in;

%Read in original image, only for purposes of calculating MSE
img = imread('brain.tif');
%img = single(img);

%Set initial I_k
I_k = im_in;

%Set padding
kernel = 6*sigma;
pad = floor((kernel-1)/2);

%Set filter
h = fspecial('gaussian',kernel,sigma);

%Allocate MSE arrays
MSE_residuals = [];
MSE_orig = [];

iterations = 0;
MSE_r = 1000;   %Just a dummy value
while MSE_r > t && iterations < max_iter
    I_k_prev = I_k;
    
    %(a) Compute A_k = I_k * G_sigma
    %[rows,cols] = size(I_k);
    %I_k = padarray(I_k,[pad pad],'symmetric');
    A_k = imfilter(I_k,h);
    %A_k = imcrop(A_k,[pad pad cols-1 rows-1]);
    %I_k = imcrop(I_k,[pad pad cols-1 rows-1]);

    %(b) Set B_k = I_0/A_k
    B_k = I_0./A_k;
    
    %(c) Compute C_k = B_k * G_sigma
    %B_k = padarray(B_k,[pad pad],'symmetric');
    C_k = imfilter(B_k,h);
    %C_k = imcrop(C_k,[pad pad cols-1 rows-1]);
    
    %(d) Set I_(k+1) = I_k x C_k
    I_k = I_k .* C_k;
    
    
    %Calculate MSE
    MSE_r = sum((sum(((I_k - I_k_prev ).^2))))/numel(I_k)
    MSE_residuals = [MSE_residuals, MSE_r];
    
    MSE_o = sum((sum(((img - I_k ).^2))))/numel(img)
    MSE_orig = [MSE_orig, MSE_o];
    
    %Increment iterations
    iterations = iterations+1;
end
    
    
    

