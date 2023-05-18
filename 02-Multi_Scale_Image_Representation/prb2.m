% Problem 2 - Laplacian Pyramid- 
% General scripts:
clc
clear all
close all

%% 
% =========================================================================
% q1
% =========================================================================

% Defining the Gaussian filter:
g_filter = zeros(9,9);
sigma =2;
mu= 5; 
for i= 1:9
for h =1:9
g_filter(i,h)= (1/((sigma^2)*(2*pi))) * exp(-(1/sigma^2)*((i-mu)^2+(h-mu)^2));
end
end
g_filter = g_filter/sum(g_filter, 'all');

% Reading the input image:
org_img = imread('boat.tiff');
org_img = im2double(org_img);
[x0, y0] = size(org_img);

% First level:
filtered_img = imfilter(org_img , g_filter);
p0 = org_img - filtered_img ;
img1 = filtered_img(1:2:end , 1:2:end);
[x1 , y1] = size(img1);

% Second level:
filtered_img = imfilter(img1 , g_filter);
p1 = img1 - filtered_img ;
img2 = filtered_img(1:2:end , 1:2:end);
[x2 , y2] = size(img2);

% Third level:
filtered_img = imfilter(img2 , g_filter);
p2 = img2 - filtered_img;
img3 = filtered_img(1:2:end , 1:2:end);
[x3 , y3] = size(img3);

%% 
% =========================================================================
% q2
% =========================================================================
% =========== a =========== %
% nearest-neighbor

I = zeros(x3+1, y3+1);
I(1:x3,1:y3) = img3;
[x, y] = meshgrid(1:65);
[xq, yq] = meshgrid(1:0.5:65);
h= imfilter(I, g_filter);
h=interp2(x,y,h,xq,yq,'nearest');
img_l2 = h(1:x2,1:y2)+p2;

I = zeros(x2+1, y2+1);
I(1:x2,1:y2) = img_l2;
[x, y] = meshgrid(1:129);
[xq, yq] = meshgrid(1:0.5:129);
h= imfilter(I, g_filter);
h= interp2(x,y,h,xq,yq,'nearest');
img_l1 = h(1:x1,1:y1)+p1;

I = zeros(x1+1, y1+1);
I(1:x1,1:y1) = img_l1;
[x, y] = meshgrid(1:257);
[xq, yq] = meshgrid(1:0.5:257);
h= imfilter(I, g_filter);
h= interp2(x,y,h,xq,yq,'nearest');
img_base = h(1:x0,1:y0)+p0;
figure(1);
imshow((img_base),[]), title('Nearest ');

% =========== b =========== %
% bilinear

I = zeros(x3+1, y3+1);
I(1:x3,1:y3) = img3;
[x, y] = meshgrid(1:65);
[xq, yq] = meshgrid(1:0.5:65);
h= imfilter(I, g_filter);
h=interp2(x,y,h,xq,yq,'linear');
img_l2 = h(1:x2,1:y2)+p2;

I = zeros(x2+1, y2+1);
I(1:x2,1:y2) = img_l2;
[x, y] = meshgrid(1:129);
[xq, yq] = meshgrid(1:0.5:129);
h= imfilter(I, g_filter);
h= interp2(x,y,h,xq,yq,'linear');
img_l1 = h(1:x1,1:y1)+p1;

I = zeros(x1+1, y1+1);
I(1:x1,1:y1) = img_l1;
[x, y] = meshgrid(1:257);
[xq, yq] = meshgrid(1:0.5:257);
h= imfilter(I, g_filter);
h= interp2(x,y,h,xq,yq,'linear');
img_base = h(1:x0,1:y0)+p0;
figure(2);
imshow((img_base),[]),title('Bilinear ');

% =========== c =========== %
% bicubic
I = zeros(x3+1, y3+1);
I(1:x3,1:y3) = img3;
[x, y] = meshgrid(1:65);
[xq, yq] = meshgrid(1:0.5:65);
h= imfilter(I, g_filter);
h=interp2(x,y,h,xq,yq,'cubic');
img_l2 = h(1:x2,1:y2)+p2;

I = zeros(x2+1, y2+1);
I(1:x2,1:y2) = img_l2;
[x, y] = meshgrid(1:129);
[xq, yq] = meshgrid(1:0.5:129);
h= imfilter(I, g_filter);
h= interp2(x,y,h,xq,yq,'cubic');
img_l1 = h(1:x1,1:y1)+p1;

I = zeros(x1+1, y1+1);
I(1:x1,1:y1) = img_l1;
[x, y] = meshgrid(1:257);
[xq, yq] = meshgrid(1:0.5:257);
h= imfilter(I, g_filter);
h= interp2(x,y,h,xq,yq,'cubic');
img_base = h(1:x0,1:y0)+p0;
figure(3);
imshow((img_base),[]), title('Bicubic ');

%% 
% =========================================================================
% q3
% =========================================================================
% Low-resolution by a factor of 8
I = zeros(x3+1, y3+1);
I(1:x3,1:y3) = img3;
[x, y]= meshgrid(1:65);
[xq, yq]= meshgrid(1:0.125:65);

img_nearest = interp2(x,y,double(I),xq,yq,'nearest');
figure(4);
imshow(img_nearest, []), title('Low-resolution- nearest');

img_linear = interp2(x,y,double(I),xq,yq,'linear');
figure(5);
imshow(img_linear, []), title('Low-resolution- linear');

img_cubic = interp2(x,y,double(I),xq,yq,'cubic');
figure(6);
imshow(img_cubic, []), title('Low-resolution- cubic');

        


