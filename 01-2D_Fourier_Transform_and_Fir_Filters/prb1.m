% Problem 1- Fourier Magnitude and Phase of Images

% General scripts:
clc
clear all;
close all;

% Reading the input images:
lena=imread('lena.tiff');
walkBridge=imread('walkbridge.tiff');

% =========================================================================
% q1
% =========================================================================

% Applying DFT on lena input image:
x_lena = fft2(double(lena));

% Magnetude and Phase of lena image:
X_lena=abs(x_lena);
i_lena=angle(x_lena);

% Defining w and Z fourier transform:
W = 1 .* exp(1i*i_lena);
Z = X_lena .* exp(1i*0);

% Taking the inverse fourier:
w = ifft2(W);
z = ifft2(Z);

% Plotting the results of operations:
figure();
imshow(lena),title('Original lena');

figure();
imshow(w,[]),title('Result of the W fourier transform');

figure();
imshow(log(1 + z),[]),title('Result of the Z fourier transform');



% =========================================================================
% q2
% =========================================================================

% Applying DFT on walkbridge input image:
y_walkBridge = fft2(double(walkBridge));

% Magnetude and Phase of walkbridge image:
Y_walkBridge=abs(y_walkBridge);
i_walkBridge=angle(y_walkBridge);

% Defining A and B new transforms:
A = Y_walkBridge .* exp(1i * i_lena);
B = X_lena .* exp(1i * i_walkBridge);

% Taking the inverse fourier:
a = ifft2(A);
b = ifft2(B);

% Plotting the results of operations
figure();
imshow(lena),title('Original lena');

figure();
imshow(walkBridge),title('Original walkbridge');

figure();
imshow(a,[]),title('Result of the A fourier transform');

figure();
imshow(b,[]),title('Result of the B fourier transform');














