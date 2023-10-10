clear;clc;close all;

img=imread('original.jpg');

[rows, columns, numberOfColorChannels] = size(img);

redFormatImage=img(:,:,1);
greenFormatImage=img(:,:,2);
blueFormatImage=img(:,:,3);

xAxis = 1:256;
histRed = zeros(1,256);
histGreen = zeros(1,256);
histBlue = zeros(1, 256);

for i=1:rows
    for j=1:columns
        histRed(redFormatImage(i,j) + 1) = histRed(redFormatImage(i,j) + 1) + 1;
        histGreen(greenFormatImage(i,j) + 1) = histGreen(greenFormatImage(i,j) + 1) + 1;
        histBlue(blueFormatImage(i,j) + 1) = histBlue(blueFormatImage(i,j) + 1) + 1;
    end
end

%figure for displaying histogram of red layer image
figure('name','Red Layer Image Histogram');
tiledlayout(2,1);

%top plot
tiled1 = nexttile;
bar(xAxis, histRed);
xlabel(tiled1,'Grey Level');
ylabel(tiled1, 'Numbers of Color');
title(tiled1,"Manual Version Histogram");

%bottom plot
tiled2 = nexttile;
bar(xAxis, imhist(redFormatImage(:)));
xlabel(tiled2,'Grey Level');
ylabel(tiled2, 'Numbers of Color');
title(tiled2, "Matlab Version Histogram (imhist function)");

%figure for displaying histogram of green format image
figure('name','Green Layer Image Histogram');
tiledlayout(2,1);

%top plot
tiled1 = nexttile;
bar(xAxis, histGreen);
xlabel(tiled1,'Grey Level');
ylabel(tiled1, 'Numbers of Color');
title(tiled1,"Manual Version Histogram");

%bottom plot
tiled2 = nexttile;
bar(xAxis, imhist(greenFormatImage(:)));
xlabel(tiled2,'Grey Level');
ylabel(tiled2, 'Numbers of Color');
title(tiled2, "Matlab Version Histogram (imhist function)");

%figure for displaying histogram of blue format image
figure('name','Blue Layer Image Histogram');
tiledlayout(2,1);

%top plot
tiled1 = nexttile;
bar(xAxis, histBlue);
xlabel(tiled1,'Grey Level');
ylabel(tiled1, 'Numbers of Color');
title(tiled1,"Manual Version Histogram");

%bottom plot
tiled2 = nexttile;
bar(xAxis, imhist(blueFormatImage(:)));
xlabel(tiled2,'Grey Level');
ylabel(tiled2, 'Numbers of Color');
title(tiled2, "Matlab Version Histogram (imhist function)");