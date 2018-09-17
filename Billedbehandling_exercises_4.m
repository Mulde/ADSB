%% billedbehandling exercise 4 
clear; close all; format compact; clc;

%% Exercise 1
% image smoothing with 2d low pass filter

%% 1 load the test image 
I = imread('noisyimage2.tif');

I = im2double(I);
imshow(I)
%% 2 Try smoothing the image with mean filters size
% 3x3, 5x5, 9x9, 15x15 and 35x35 use imfilter

% oprettelse af filtre
Lfilter3 = ones(3)/9;
Lfilter5 = ones(5)/25;
Lfilter9 = ones(9)/81;
Lfilter15 = ones(15)/225;
Lfilter35 = ones(35)/1225;
% applying the filters
I3 = imfilter(I,Lfilter3,'conv');
I5 = imfilter(I,Lfilter5,'conv');
I9 = imfilter(I,Lfilter9,'conv');
I15 = imfilter(I,Lfilter15,'conv');
I35 = imfilter(I,Lfilter35,'conv');

figure
% original image
subplot(2,3,2)
imshow(I)
title("original")
% 3x3
subplot(2,3,1)
imshow(I3)
title("3x3")
% 5x5
subplot(2,3,3)
imshow(I5)
title("5x5")
% 9x9
subplot(2,3,4)
imshow(I9)
title("9x9")
% 15x15
subplot(2,3,5)
imshow(I15)
title("15x15")
% 35x35
subplot(2,3,6)
imshow(I35)
title("35x35")

%% 3 explain what happens at the border
% try out different methods for dealing with border as described at 212 
figure
% symmetric border option
I3s = imfilter(I,Lfilter3,'conv','symmetric');
I5s = imfilter(I,Lfilter5,'conv','symmetric');
I9s = imfilter(I,Lfilter9,'conv','symmetric');
I15s = imfilter(I,Lfilter15,'conv','symmetric');
I35s = imfilter(I,Lfilter35,'conv','symmetric');

% replicate border option
I3r = imfilter(I,Lfilter3,'conv','replicate');
I5r = imfilter(I,Lfilter5,'conv','replicate');
I9r = imfilter(I,Lfilter9,'conv','replicate');
I15r = imfilter(I,Lfilter15,'conv','replicate');
I35r = imfilter(I,Lfilter35,'conv','replicate');

% circular border option
I3c = imfilter(I,Lfilter3,'conv','circular');
I5c = imfilter(I,Lfilter5,'conv','circular');
I9c = imfilter(I,Lfilter9,'conv','circular');
I15c = imfilter(I,Lfilter15,'conv','circular');
I35c = imfilter(I,Lfilter35,'conv','circular');

%plots symmetric
figure
% original image
subplot(2,3,2)
imshow(I)
title("original")
% 3x3
subplot(2,3,1)
imshow(I3s)
title("3x3 symmetric")
% 5x5
subplot(2,3,3)
imshow(I5s)
title("5x5 symmetric")
% 9x9
subplot(2,3,4)
imshow(I9s)
title("9x9 symmetric")
% 15x15
subplot(2,3,5)
imshow(I15s)
title("15x15 symmetric")
% 35x35
subplot(2,3,6)
imshow(I35s)
title("35x35 symmetric")

%plots replicate
figure
% original image
subplot(2,3,2)
imshow(I)
title("original")
% 3x3
subplot(2,3,1)
imshow(I3r)
title("3x3 Replicate")
% 5x5
subplot(2,3,3)
imshow(I5r)
title("5x5 Replicate")
% 9x9
subplot(2,3,4)
imshow(I9r)
title("9x9 Replicate")
% 15x15
subplot(2,3,5)
imshow(I15r)
title("15x15 Replicate")
% 35x35
subplot(2,3,6)
imshow(I35r)
title("35x35 Replicate")

%% circular
figure
% original image
subplot(2,3,2)
imshow(I)
title("original")
% 3x3
subplot(2,3,1)
imshow(I3c)
title("3x3 circular")
% 5x5
subplot(2,3,3)
imshow(I5c)
title("5x5 circular")
% 9x9
subplot(2,3,4)
imshow(I9c)
title("9x9 circular")
% 15x15
subplot(2,3,5)
imshow(I15c)
title("15x15 circular")
% 35x35
subplot(2,3,6)
imshow(I35c)
title("35x35 circular")

%% 5 try smoothing the image with the gaussian blur filter 
sigma = 5;
hg3 = fspecial('gaussian',3,sigma);
hg5 = fspecial('gaussian',5,sigma);
hg9 = fspecial('gaussian',9,sigma);
hg15 = fspecial('gaussian',15,sigma);
hg35 = fspecial('gaussian',35,sigma);

I3g = imfilter(I,hg3,'conv');
I5g = imfilter(I,hg5,'conv');
I9g = imfilter(I,hg9,'conv');
I15g = imfilter(I,hg15,'conv');
I35g = imfilter(I,hg35,'conv');

% plots 
figure
% original image
subplot(2,3,2)
imshow(I)
title("original")
% 3x3
subplot(2,3,1)
imshow(I3g)
title("3x3 Gaussian")
% 5x5
subplot(2,3,3)
imshow(I5)
title("5x5 Gaussian")
% 9x9
subplot(2,3,4)
imshow(I9g)
title("9x9 Gaussian")
% 15x15
subplot(2,3,5)
imshow(I15g)
title("15x15 Gaussian")
% 35x35
subplot(2,3,6)
imshow(I35g)
title("35x35 Gaussian")

%% exercise 2 
% image sharpening using the laplacian and unsharp 
I = imread('moon.tif');
imshow(I)
I = im2double(I);

alpha1 = [0,1,0;1,-4,1;0,1,0];
alpha2 = [0,-1,0;-1,5,-1;0,-1,0];

IL1 = imfilter(I,alpha1);
IL2 = imfilter(I,alpha2);

figure 
subplot(1,3,1)
imshow(IL1+0.5)