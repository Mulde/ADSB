%% billedbehandling exercise 5
clear; close all; format compact; clc;

%% exercise 1 erosion

% Create a binary image and a structuring element as shown below
I = [0 0 0 0 0 0 0 0;
     0 1 1 1 1 1 0 0;
     0 1 1 1 1 1 0 0;
     0 0 1 1 1 1 0 0;
     0 0 1 1 1 1 0 0;
     0 0 0 0 0 0 0 0];

SE = [0 1 0;
      1 1 1;
      0 1 0];
  
figure
subplot(1,3,1)
imshow(I)
title("original")

% 2 erode the image with the structuring element SE

IE = imerode(I,SE);

subplot(1,3,2)
imshow(IE)
title("eroded image")

% 3 now try witht he wuare 3x3 structuring element
SE = ones(3);

IE = imerode(I,SE);
subplot(1,3,3)
imshow(IE)

% 4 load the binary image wirebond mask and show it

I = imread('wirebond-mask.tif');
figure
subplot(2,2,1)
imshow(I)
title("original")

% 5 create a square element of size 11x11 and erode the image with it
M1 = 11;
SE11 = strel('square', M1);

IE11 = imerode(I,SE11);

subplot(2,2,2)
imshow(IE11)
title("11 square")

% 6 try with 15 and 45
M2 = 15;
M3 = 45;
SE15 = strel('square', M2);
SE45 = strel('square', M3);

IE15 = imerode(I,SE15);
IE45 = imerode(I,SE45);

subplot(2,2,3)
imshow(IE15);
title("15x15")

subplot(2,2,4)
imshow(IE45)
title("45x45")


%% exercise 2 dilation 
% work with the fundamental morphological operation diltion
% 1 create the binaray image and SE
I=zeros(6); 
I(4:5,3:4)=1;


SE = [0 1 0;
      1 1 1;
      0 1 0];

% 2 dilate the image with the structuring element

ID = imdilate(I,SE);

figure 
subplot(1,2,1)
imshow(I)
title("original")

subplot(1,2,2)
imshow(ID)
title("dilated image")

% 3 load the binary image “text_gaps_1_and_2_pixels.tif” and show it.

I = imread('text_gaps_1_and_2_pixels.tif');
figure
subplot(1,2,1)
imshow(I)
title("original")

% 4 dilate the new image and show it

ID = imdilate(I,SE);
subplot(1,2,2)
imshow(ID)
title("new dilated image")

%% exercise 3 opening
% Work with the compound morphological operation “opening” which is erosion followed by dilation.

% 1 Load the noisy test image “opening_testimage1.tif”. Show the image. 
% How many objects are there in the image?

I = imread('opening_testimage1.tif');
figure
subplot(1,3,1)
imshow(I)
title("original")
% there are one object x

% 2 open the image using a square SE and show it 
M =4;
SE = strel('square',M);

IE = imerode(I,SE);
ID = imdilate(IE,SE);
 
subplot(1,3,2)
imshow(ID)
title("opened")
% the minimun size of the SE is 2 depending on the application

% 4 try a circular SE
R = 2;

SE = strel('disk',R);

IE = imerode(I,SE);
subplot(1,3,3)
imshow(IE);
% dependin gon the size of the SE


%% exercise 4 - closing
% Work with the compound morphological operation “closing” which is dilation 
% followed by erosion.

% 1 load the image closing_testimage1.tif

I = imread('closing_testimage1.tif');
figure
subplot(1,3,1)
imshow(I)
title("original")

% close the image with a square SE 

% the SE 
M = 4;
SE = strel('square',M);

ID = imdilate(I, SE);

subplot(1,3,2)
imshow(ID)
title("dilated")

IE = imerode(ID, SE);
subplot(1,3,3)
imshow(IE)
title("eroded");


%% exercise 5 Morphological filtering

% 1 load the image noisy_fingerprint.tif and show it

I = imread('noisy_fingerprint.tif');
figure
subplot(2,3,1)
imshow(I)
title("original")

% 2 create a 3x3  structuring element SE

SE = [1 1 1;
      1 1 1;
      1 1 1];


% 3 erode the image

IE = imerode(I,SE);
subplot(2,3,2)
imshow(IE)
title("eroded")

% 4 dilate the eroded image

ID = imdilate(IE,SE);
subplot(2,3,3)
imshow(ID)
title("eroded dilated(OPENED)")

% 5 dilate the dilation
IDD = imdilate(ID,SE);
subplot(2,3,4)
imshow(ID)
title("eroded dilated  dilated")

% 6 erode the dilation 

IEE = imerode(IDD,SE);
subplot(2,3,5)
imshow(IEE)
title("eroded dilated dilated eroded (CLOSED)")

subplot(2,3,6)
IDF = imshowpair(I, IEE, 'falsecolor');

title("difference between original and output")
% 7 EXPLAIN

%% exercise 6 - Extraction and labelling of connected components

% create the binary image 
I=zeros(6,7); 
I(1,5:6)=1; 
I(2,2:4)=1; 
I(3,3:4)=1;
I(3:5,7)=1;
I(5,5)=1;
I(5:6,2:3)=1;
imshow(I)

% 2 use bwlabel to count and label the connected components
[IB4,conn4] = bwlabel(I,4);
[IB8,conn8] = bwlabel(I,8);
% 3 how many connected components are there in the image








    