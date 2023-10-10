clear; clc; close all;

img = imread("greyscale_img2.jpg");
[rows, cols] = size(img);
MN = rows * cols;

hist = imhist(img);
PDF = hist / MN;
CDF = cumsum(PDF) * 256;
CDF = round(CDF);

resultImg = uint8(rows:cols);
for i = 1 : rows
    for j = 1 : cols
        resultImg(i,j) = CDF(img(i,j) + 1);
    end
end

% histogram comparison results
figure('name','Display Result');
tiledlayout(2,1);

%top plot
tiled1 = nexttile;
bar(1:256, hist);
title(tiled1,"Original Histogram");

%bottom plot
tiled2 = nexttile;
bar(1:256, imhist(resultImg));
title(tiled2, "Result Histogram");

%image comparison results
figure('name','Display Result');
tiledlayout(2,1);

%top plot
tiled1 = nexttile;
imshow(img);
title(tiled1,"Original Image");

%bottom plot
tiled2 = nexttile;
imshow(resultImg);
title(tiled2, "Result Image");