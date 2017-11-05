%Quantization function for Question3

function[quantized_image] = myQuantize(input_gs_image, N)

    %First thing is to convert input bit value to # of bins
    %2^n
    N = pow2(N);

    %Convert input greyscale image to double
    image_d = double(input_gs_image);

    %Reshaping the image into an array
    image_size = size(image_d);
    image_array = reshape(image_d, prod(image_size), 1);
    
    %Quantization Parameters
    total_range = 255;
    quantization_width = total_range/N;
    
    quantization_value = zeros(N+1,1);
    
    %Perform Quantization
    for  i = 1:N+1
        quantization_value(i,1) = quantization_width*(i-1);
    end
    
    difference_array = zeros(N,1);
    
    for i = 1:1:length(image_array)
        for j = 1:1:N+1
            
            difference_array(j,1) = abs(image_array(i,1) - quantization_value(j,1));
        end
         [~, index] = min(difference_array);
         image_array(i,1) = quantization_value(index,1);
    end
            
    
    
    
    
    quantized_image = reshape(image_array, image_size(1), image_size(2));
    quantized_image = uint8(quantized_image);
    
    
    
    




end
