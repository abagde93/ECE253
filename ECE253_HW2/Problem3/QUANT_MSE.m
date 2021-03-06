%Problem 3 - Lloyd-Max Quantizer

function MSE = QUANT_MSE(im)

%%Part1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Defined seperate function myQuantize
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Part2 and Part3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Reshape image in order to perform Lloyd-Max quantizing
[M,N] = size(im);
training_set = reshape(im,N*M,1);

%Preallocate MSE arrays
MSE_myQ_orig = [];
MSE_LM_orig = [];

for s = 1:1:7
    
      %Performing uniform quantization using myQuantize function
      im_quantized = myQuantize(im, s);
      
      %Find MSE between myQuantize'd and original image
      MSE = sum((sum(((im_quantized - im).^2))))/numel(im);
      MSE_myQ_orig = [MSE_myQ_orig, MSE];
      
      %Performing Lloyd Max quantization
      len = 2.^s;
      training_set = double(training_set);
      [partition, codebook] = lloyds(training_set, len);
      [im_lloyd ,index] = quantiz(training_set,partition,codebook);
      im_lloyd = (im_lloyd/len)*255;
      im_lloyd = reshape(im_lloyd,[M,N]);
      im_lloyd = uint8(im_lloyd);
      
      %Find MSE between LM-Quantize'd and original image
      MSE = sum((sum(((im_lloyd - im).^2))))/numel(im);
      MSE_LM_orig = [MSE_LM_orig, MSE];
      
      %Show images at s-bit quantization levels
      subplot(2,7,s)
      imshow(im_quantized)
      title(sprintf('myQuantize %d bit', s))
      
      
      subplot(2,7,s+7)
      imshow(im_lloyd)
      title(sprintf('Lloyd-Max %d bit', s))
end

%Plot MSE vs bits
figure
subplot(1,2,1)
plot(MSE_myQ_orig)
title('MSE - myQuantize')
xlabel('#-bit image')
ylabel('MSE')

subplot(1,2,2)
plot(MSE_LM_orig)
title('MSE - LM-Quantize')
xlabel('#-bit image')
ylabel('MSE')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%