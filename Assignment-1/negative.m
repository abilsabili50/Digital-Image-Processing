clear;clc;close all;

img=imread("original.jpg");

[rows, columns, numberOfColorChannels] = size(img);

negativeImageResult=uint8(zeros(rows, columns, numberOfColorChannels));

for row=1:rows
    for col=1:columns
        for chan=1:numberOfColorChannels
            negativeImageResult(row, col, chan)=255 - img(row, col, chan);
        end
    end
end

figure("Name", "Image Tresholding Results");
tiledlayout(1,2);

tiled1=nexttile;
imshow(img);
title(tiled1, "Original Image");

tiled2=nexttile;
imshow(negativeImageResult);
title(tiled2, "Negative Image");