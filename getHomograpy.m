clc;
clear;

fileName = "images/IMG_6879.JPEG";
[image,meta] = iread(fileName,'double');


colorSelector = 3;
newImage = colorDetector(image,colorSelector);
%idisp({image,newImage})
blobs = iblobs(newImage,'class',1)


if (meta.Width)/2 < blobs(2).umax
    p3(2)= blobs(2).umax;
    p3 =  p3';
end