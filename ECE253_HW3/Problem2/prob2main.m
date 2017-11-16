%Problem 2: Butterworth Notch Reject Filtering in Frequency Domain

clear;
clc;

img = imread('car.tif');
imshow(img)
pad_img = padarray(img, [133 172]);

%Show FFT of image with "impulse-like" bursts
pad_img = fft2(pad_img);
pad_img = fftshift(pad_img);

figure
imagesc(-256:255,-256:255,log(abs(pad_img)));
colorbar;
xlabel('u');
ylabel('v');

[u,v]=meshgrid(-256:255);

%Implement the Notch reject filter
D_0 = 1;
n = 2;


u_k = -89;
v_k = -165;
D_K = ((u - u_k).^2 + (v - v_k).^2).^.5;
D_negK = ((u + u_k).^2 + (v + v_k).^2).^.5;
filt_p = 1./(1+(D_0./D_K).^(2*n));
filt_n = 1./(1+(D_0./D_negK).^(2*n));
filter1 = filt_p.*filt_n;

u_k = -89;
v_k = -81;
D_K = ((u - u_k).^2 + (v - v_k).^2).^.5;
D_negK = ((u + u_k).^2 + (v + v_k).^2).^.5;
filt_p = 1./(1+(D_0./D_K).^(2*n));
filt_n = 1./(1+(D_0./D_negK).^(2*n));
filter2 = filt_p.*filt_n;

u_k = -83;
v_k = 86;
D_K = ((u - u_k).^2 + (v - v_k).^2).^.5;
D_negK = ((u + u_k).^2 + (v + v_k).^2).^.5;
filt_p = 1./(1+(D_0./D_K).^(2*n));
filt_n = 1./(1+(D_0./D_negK).^(2*n));
filter3 = filt_p.*filt_n;

u_k = -83;
v_k = 172;
D_K = ((u - u_k).^2 + (v - v_k).^2).^.5;
D_negK = ((u + u_k).^2 + (v + v_k).^2).^.5;
filt_p = 1./(1+(D_0./D_K).^(2*n));
filt_n = 1./(1+(D_0./D_negK).^(2*n));
filter4 = filt_p.*filt_n;

%Apply notch filter(s) to image
G = pad_img.*filter1.*filter2.*filter3.*filter4; 
figure
imagesc(-256:255,-256:255,log(abs(G)));
colorbar;

G = ifft2(G);
G = uint8(G);
figure
imshow(G)



