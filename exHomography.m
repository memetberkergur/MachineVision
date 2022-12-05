clc;
clear;

fileName = "images/inclined.jpeg";
[image,meta] = iread(fileName,'double');


colorSelector = 3;
newImage = colorDetector(image,colorSelector);
%idisp({image,newImage})
blobs = iblobs(newImage)

p1 = blobs(4).p
blobs(4).plot_box;
p2 = blobs(10).p;
blobs(10).plot_box;
p3 = blobs(2).p;
blobs(2).plot_box;
p4 = blobs(9).p;
blobs(9).plot_box;


q1 = [19.5;367.4];
q2 = [19.5;19.5];
q3 = [367.4;367.4];
q4 = [367.4;19.5];

% q1 = [1.95;36.74];
% q2 = [1.95;1.95];
% q3 = [36.74;36.74];
% q4 = [36.74;1.95];

%  q = H*p

p = [p1 p2 p3 p4]
q = [q2 q1 q4 q3]
H = 10*homography(p,q)
deneme = homwarp(H,image,'full');

% deneme = colorDetector(deneme,2);
idisp({image,deneme})
%Q = homtrans(H,p)