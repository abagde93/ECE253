function [im_out] = canny_edge(im_in, t_e)

%Smooth image using Guassian Kernel
im_in=double(im_in);
k = (1/159).*[2 4 5 4 2;4 9 12 9 4;5 12 15 12 5;4 9 12 9 4;2 4 5 4 2];
smooth_img = imfilter(im_in,k);

%Find gradient images in the x and y directions
k_x = [-1 0 1;-2 0 2;-1 0 1];
k_y = [-1 -2 -1;0 0 0;1 2 1];

grad_x = imfilter(im_in,k_x);
grad_y = imfilter(im_in,k_y);
grad_image = ((grad_x.^2) + (grad_y.^2)).^5;
grad_theta = atan(grad_y./grad_x);


%Now perform the non-maximum supression
[l,w] = size(im_in);
nms_image = zeros(l,w);

%8-connected nighbors are at the following angles
%-22.5 to 22.5 and 157.5 to 202.5 --> x axis
%22.5 to 67.5 and 202.5 to 247.5 --> 45deg axis
%67.5 to 112.5 and 247.5 to 292.5 --> y axis
%112.5 to 157.5 and 292.5 to -22.5 --> 135deg axis

for i=2:l-1
        for j=2:w-1
               if (grad_theta(i,j)>=-22.5 || grad_theta(i,j)<=22.5) || (grad_theta(i,j)>=157.5 && grad_theta(i,j)<=202.5)  
                 if (grad_image(i,j+1)>grad_image(i,j)) || (grad_image(i,j-1)>grad_image(i,j))
                    nms_image(i,j)=0;
                 else
                    nms_image(i,j)=grad_image(i,j);
                end

               elseif (grad_theta(i,j)>22.5 && grad_theta(i,j)<=67.5) || (grad_theta(i,j)>202.5 && grad_theta(i,j)<=247.5) 
                 if (grad_image(i+1,j+1)>grad_image(i,j)) || (grad_image(i-1,j-1)>grad_image(i,j))
                    nms_image(i,j)=0;
                 else
                    nms_image(i,j)=grad_image(i,j);
                 end
                 
               elseif (grad_theta(i,j)>67.5 && grad_theta(i,j)<=112.5) || (grad_theta(i,j)>247.5 && grad_theta(i,j)<=292.5) 
                 if (grad_image(i-1,j)>grad_image(i,j)) ||(grad_image(i+1,j)>grad_image(i,j))
                    nms_image(i,j)=0;
                 else
                    nms_image(i,j)=grad_image(i,j);
                 end
                 
               else 
                 if (grad_image(i-1,j+1)>grad_image(i,j)) || (grad_image(i+1,j-1)>grad_image(i,j))
                    nms_image(i,j)=0;
                 else
                    nms_image(i,j)=grad_image(i,j);
                 end
               end
         end
end
        
%Threholding step
nms_image = nms_image/max(nms_image(:));
for i=2:l-1
    for j=2:w-1
        if nms_image(i,j) > t_e
            nms_image(i,j) = 1;
        else
            nms_image(i,j) = 0;
        end
    end
end

im_out = nms_image;



end
