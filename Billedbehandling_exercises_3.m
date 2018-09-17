%% Billedbehandling exercises 3
clear; close all; format compact; clc; 

%% 1 loading the image into matlab
I = imread('cameraman.tif');

%% 2 what is the size and data type of i and how many bytes does it take up
% Størrelsen på billedet er 256x256 pixel som man kan se ud af størrelsen
% af arrayet og mængden af hukommelse kan udlæses fra hvor workspacet ude 
% i siden og data typen er en matrice af størrelse 
whos I
% Størrelse 256x256
% data typen er en 256x256 matrice af 8 bit tal
% og den optager 65536 bytes hukommelse

%% 3 show the image and try imtool
figure
subplot(2,3,2)
imshow(I)
title("Original")
% imtool(I);

%% 4 find the minimun and maximum pixel value of the image
min(I(:))
max(I(:))

%% 5 convert the image from uint8 to doubles in the range
I2 = im2double(I);

%% 6 whats it the result of 
% a. adding positive constant scalar to the image?
IA = I2+0.50;
subplot(2,3,1)
imshow(IA)
title("Brighter")
% makes the image brighter

% b. subtracting a positive constant (scalar) from the image?
IS = I2-0.50;
subplot(2,3,4)
imshow(IS)
title("darker")
% makes the image darker and can highlight the whites in the image

% C. multiplying the image by a positive constant greater than 1?
IM1 = I2*2;
subplot(2,3,3)
imshow(IM1)
title("+Contrast")
% hightens the contrast og the image

% d. multiplying the image by a positive constant less than 1?

IM2 = I2*(0.5);
subplot(2,3,6)
imshow(IM2)
title("-Contrast")
% lowers the contrast og the image

%% 7 calculate the negative of the image  show it in the same plot
Ineg = 1-I2;
subplot(2,3,5)
imshow(Ineg)
title("Negative")

%% 8 convert the negative image to uint8 and write it to a file with imwrite
Ineg = im2uint8(Ineg);
figure
imshow(Ineg)
imwrite(Ineg,'negimage.tif')

%% 9 Cut out a subimage (50x50 pixels) of I that contains the cameraman’s head. Show.
IC = imcrop(Ineg); %interactive tool
figure
IC2 = I(40:90,90:140); %%looking only at specified pixels
imshow(IC2)

%% 10 shrink the image by takign every other pixel in the image
ISH = imresize(I, 0.5);
figure
imshow(ISH)

%% exercise 2
% working with colour images in matlab
%% 1 load in the image
IRGB = imread('pepperswithsquares.bmp');
imshow(IRGB)

%% 2 what is the size and data type of the image
% størrelsen er en 384x512x3 
whos IRGB

%% 3 subtract the red green and blue components og the image and show them
% as gray scale images in a subplot

IGred = IRGB(:,:,1); %the Red
IGgreen = IRGB(:,:,2); %the Green
IGblue = IRGB(:,:,3); %the Blue

figure

% original
subplot(2,2,1)
imshow(IRGB)
title("Original")

% red grayscale
subplot(2,2,2)
imshow(IGred)
title("Red grayscale")

% Green grayscale
subplot(2,2,3)
imshow(IGgreen)
title("Green grayscale")

% Blue Grayscale
subplot(2,2,4)
imshow(IGblue)
title("Blue grayscale")
%imfilter(f,h,'conv')
%% 4 convert the orignal image to grayscale by taking the average(mean)
% value across the three color layers
Gray1 = 0.333 * IGred + 0.333 * IGgreen + 0.333 * IGblue;
Gray2 = 0.299 * IGred + 0.587 * IGgreen + 0.114 * IGblue;

figure
subplot(1,2,1)
imshow(Gray1)
title("even gray")

subplot(1,2,2)
imshow(Gray2)
title("uneven gray")

%% exercise 