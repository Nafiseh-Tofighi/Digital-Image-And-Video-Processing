% Problem 3 - 2-D Wavelet Transform- 
% General scripts:
clc
clear all
close all

%% 
% =========================================================================
% q1
% =========================================================================
% Reading the input image:
org_img = imread('boat.tiff');
[m , n] = size(org_img);
img = im2double(org_img);

% Haar wavelet:
% Computing the wavelet:
for i= 1:m
    [l1(i,:),h1(i,:)] = dwt(g(i,:),'db1');
end

for j=1:n/2
    [ll1(:,j),lh1(:,j)] = dwt(l1(:,j),'db1');
    [hl1(:,j),hh1(:,j)] = dwt(h1(:,j),'db1');
end

for i= 1:m/2
    [l2(i,:),h2(i,:)] = dwt(ll1(i,:),'db1');
end

for j=1:n/4
    [ll2(:,j),lh2(:,j)] = dwt(l2(:,j),'db1');
    [hl2(:,j),hh2(:,j)] = dwt(h2(:,j),'db1');
end

% Constructing the output:
haar_w= [[ll2,lh2;hl2,hh2] , lh1; hl1, hh1];

% Normalizing:
normalized_haar_w = adapthisteq(haar_w,'clipLimit',0.01,'Distribution','rayleigh');

% Ploting the outputs:
figure(1);
imshow(haar_w,[]),title('Haar');
figure(2);
imshow(normalized_haar_w,[]), title('Haar(normalized)');


%% 
% =========================================================================
% q1
% =========================================================================
% General scripts:
clc
clear all

% Reading the input image:
org_img = imread('boat.tiff');
[m , n] = size(org_img);
img = im2double(org_img);

% Biorthogonal wavelet
% Computing the wavelet:
for i= 1:m
    [l1(i,:),h1(i,:)] = dwt(x(i,:),'bior3.5');
end

for j=1:size(l1,2)
    [ll1(:,j),lh1(:,j)] = dwt(l1(:,j),'bior3.5');
    [hl1(:,j),hh1(:,j)] = dwt(h1(:,j),'bior3.5');
end

for i= 1:size(ll1,2)
    [l2(i,:),h2(i,:)] = dwt(ll1(i,:),'bior3.5');
end

for j=1:size(l2,2)
    [ll2(:,j),lh2(:,j)] = dwt(l2(:,j),'bior3.5');
    [hl2(:,j),hh2(:,j)] = dwt(h2(:,j),'bior3.5');
end

% Constructing the output:
biorthogonal_w =zeros(533,533);
biorthogonal_w(1:272,1:272) = [ll2,lh2;hl2,hh2];
biorthogonal_w(1:261,273:533) = lh1;
biorthogonal_w(273:533,1:261) = hl1;
biorthogonal_w(273:533,273:533) = hh1;

% Normalizing:
normalized_biorthogonal_w = adapthisteq(biorthogonal_w,'clipLimit',0.01,'Distribution','rayleigh');

% Ploting the output:
figure(3);
imshow(biorthogonal_w,[]), title('Biorthogonal');
figure(4);
imshow(normalized_biorthogonal_w,[]), title('Biorthogonal(normalized)');



