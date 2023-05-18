% Problem 1 - Gaussian Pyramid 
% General scripts:
clc
clear all
close all

%% 
% =========================================================================
% q1
% =========================================================================

% Defining the Gaussian filter:
g_filter= zeros(7,7);
sigma= 2;
mu= 2; 
for i= 1:7
for j =1:7
g_filter(i,j)= (1/((sigma^2)*(2*pi))) * exp(-(1/sigma^2)*((i-mu)^2+(j-mu)^2));
end
end
g_filter = g_filter/sum(g_filter, 'all');
 
% Cunstructing the base of pyramid witch is the input images:
img0 = imread('boat.tiff');
[x0 , y0] = size(img0);
 
% First level:
img = imfilter(img0 , g_filter);
img1 = zeros(x0 , y0);
img1 = img(1:2:end , 1:2:end);
[x1 , y1] = size(img1);
 
% Second level:
img = imfilter(img1 , g_filter);
img2 = zeros(x1 , y1);
img2 = img(1:2:end , 1:2:end);
[x2 , y2] = size(img2);

% Third level:
img = imfilter(img2 , g_filter);
img3 = zeros(x2 , y2);
img3 = img(1:2:end , 1:2:end);
[x3 , y3] = size(img3);

% Forth level:
img = imfilter(img3 , g_filter);
img4 = zeros(x3 , y3);
img4 = img(1:2:end , 1:2:end);
[x4 , y4] = size(img4);
 
% Adding all levels togather:
P = zeros(x0 , y0 + y1);
P (1:x0,1:y0) = img0;
P(1:x1,y0+1:y0+y1) = img1;
P(x1+1:x1+x2 ,y0+1:y0+y2) =img2;
P(x1+1:x1+x3 ,y0+y2+1:y0+y2+y3) = img3;
P(x1+1:x1+x4 ,y0+y2+y3+1:y0+y2+y3+y4) = img4;
figure(1);
imshow(uint8(P)),title('4-level Pyramid - Gaussian Filter');

%%
% =========================================================================
% q2
% =========================================================================

% Defining the Box filter:
b_filter = (1/49)* ones(7,7);

% Cunstructing the base of pyramid witch is the input images:
img0 = imread('boat.tiff');
[x0 , y0] = size(img0);
 
% First level:
img = imfilter(img0 , b_filter);
img1 = zeros(x0 , y0);
img1 = img(1:2:end , 1:2:end);
[x1 , y1] = size(img1);
 
% Second level:
img = imfilter(img1 , b_filter);
img2 = zeros(x1 , y1);
img2 = img(1:2:end , 1:2:end);
[x2 , y2] = size(img2);

% Third level:
img = imfilter(img2 , b_filter);
img3 = zeros(x2 , y2);
img3 = img(1:2:end , 1:2:end);
[x3 , y3] = size(img3);

% Forth level:
img = imfilter(img3 , g_filter);
img4 = zeros(x3 , y3);
img4 = img(1:2:end , 1:2:end);
[x4 , y4] = size(img4);

% Adding all levels togather:
P = zeros(x0 , y0 + y1);
P (1:x0,1:y0) = img0;
P(1:x1,y0+1:y0+y1) = img1;
P(x1+1:x1+x2 ,y0+1:y0+y2) =img2;
P(x1+1:x1+x3 ,y0+y2+1:y0+y2+y3) = img3;
P(x1+1:x1+x4 ,y0+y2+y3+1:y0+y2+y3+y4) = img4;
figure(2)
imshow(uint8(P)),title('4-level Pyramid - Box Filter');

%%
% =========================================================================
% q3
% =========================================================================
 
% First level:
img1 = zeros(x0 , y0);
img1 = img0(1:2:end , 1:2:end);
[x1 , y1] = size(img1);

% Second level:
img2 = zeros(x1 , y1);
img2 = img1(1:2:end , 1:2:end);
[x2 , y2] = size(img2);
 
% Third level:
img3 = zeros(x2 , y2);
img3 = img2(1:2:end , 1:2:end);
[x3 , y3] = size(img3);
 
% Forth level:
img4 = zeros(x3 , y3);
img4 = img3(1:2:end , 1:2:end);
[x4 , y4] = size(img4);

% Adding all levels togather:
P = zeros(x0 , y0 + y1);
P (1:x0,1:y0) = img0;
P(1:x1,y0+1:y0+y1) = img1;
P(x1+1:x1+x2 ,y0+1:y0+y2) =img2;
P(x1+1:x1+x3 ,y0+y2+1:y0+y2+y3) = img3;
P(x1+1:x1+x4 ,y0+y2+y3+1:y0+y2+y3+y4) = img4;
figure(3)
imshow(uint8(P)),title('4-level Pyramid - Without Filtering');


