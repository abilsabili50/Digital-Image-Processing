clear; clc; close all;

imgReader=imread("original.jpg");

greyscaleImg=rgb2gray(imgReader);

[rows, columns]=size(greyscaleImg);

tresholdImageContainer=uint8(zeros(rows, columns));
tresholdConst=80;

for row=1:rows
    for col=1:columns
        pxlValue=greyscaleImg(row, col);
        if pxlValue>tresholdConst
            tresholdImageContainer(row, col)=255;
        else
            tresholdImageContainer(row, col)=0;
        end
    end
end

figure("Name", "Image Tresholding Results");
tiledlayout(1,2);

tiled1=nexttile;
imshow(greyscaleImg);
title(tiled1, "Greyscale Image");

tiled2=nexttile;
imshow(tresholdImageContainer);
title(tiled2, "Image Results (Treshold = "+tresholdConst+")");