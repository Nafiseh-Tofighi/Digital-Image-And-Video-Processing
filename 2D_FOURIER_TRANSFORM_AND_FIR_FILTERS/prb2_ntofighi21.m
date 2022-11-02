% Problem 2- Frequency Response, 2-D Convolution - ntofighi21

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

% Defining a 1-D filter
h = (1/9)*ones(9,1);

%zero padding
padded_h = zeros(512,512);
padded_h(1:9,1:9) = h * h';

% Applying DFT on lena input image:
H = fft2(padded_h);

% Magnetude and Phase information:
amplitude=abs(H);
phase=angle(H);

% Plotting the results of operations:
figure();
imshow(amplitude,[]); title('Frequency response-amplitude');

figure();
imshow(phase,[]); title('Frequency response-phase');

% =========================================================================
% q2
% =========================================================================

% Initiating the parameters:
sigma = 1;
amplitude = 1 / (sigma * sqrt(2*pi)); 
w = zeros(9,9);

for x= 1 : 9
    for y = 1: 9
        e = ((x).^2 + (y).^2)./(2 * sigma ^ 2);
        w(x,y) = amplitude  * exp(-e);
    end
end

%zero padding
padded_w = zeros(512,512);
padded_w(1:9,1:9) = w;

% Applying DFT on lena input image:
W = fft2(padded_w);

% Magnetude and Phase information:
amplitude=abs(W);
phase=angle(W);

% Plotting the results of operations:
figure();
imshow(amplitude,[]); title('Amplitude');

figure();
imshow(phase,[]); title('Phase');

% =========================================================================
% q3
% =========================================================================

% Reading the input images:
lena=imread('lena.tiff');

% Applying DFT on lena input image:
X = fft2(lena);

% seprable filter:
h_zero_phase = zeros(512,512);
h_zero_phase(1:8,1:8) = padded_h(2:9,2:9);
h_zero_phase(1:8,510) = padded_h(2:9,1);
h_zero_phase(510,1:8) = padded_h(1,2:9);
h_zero_phase(510,510) = padded_h(1,1);

% Filtering the image with constructed filters:
H_zero_phase = fft2(h_zero_phase);


% circulary symetric filter:
w_zero_phase = zeros(512,512);
w_zero_phase(1:511,1:511) = padded_w(2:512,2:512);
w_zero_phase(1:511,512) = padded_w(2:512,1);
w_zero_phase(512,1:511) = padded_w(1,2:512);
w_zero_phase(512,512) = padded_w(1,1);

% Filtering the image with constructed filters:
W_zero_phase = fft2(w_zero_phase);


% Computing the product:
Y1 = X.* H_zero_phase;
Y2 = X.* W_zero_phase;

% Inverse 2D DFT of the product:
y1 = ifft2(Y1);
y2 = ifft2(Y2);

figure();
imshow(lena),title('original lena');
figure();
imshow(y1,[]),title('Seprable filter');
figure();
imshow(y2,[]),title('Circulary symetric filter ')
