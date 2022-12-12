clc;
clear;

fileName = "images/inclined.jpeg";
%fileName = "images/IMG_6879.JPEG";
[image,meta] = iread(fileName,'double');


newImage = colorDetector(image,3);
blobs = iblobs(newImage,'class',1);
%idisp(newImage)
p = blobs.p;

xvalue = p(1,:);
yvalue = p(2,:);
[Ysorted I] = sort(yvalue);
Xsorted = xvalue(I);
pSorted = [Xsorted;Ysorted];
tempP=pSorted;
sortedXvalue = sort(xvalue);
enkucuk3Udegeri = sortedXvalue(1:3);
tempArray = [];

for i = 1:9
    temp = pSorted(:,i);
    for j = 1:3
        if enkucuk3Udegeri(j) == temp(1)
            tempArray = cat(2,tempArray,pSorted(:,i));
            tempP(:,i)=[0;0];
        end
    end
end
[~, sutun]= find(tempP==0);
sutun = unique(sutun, 'rows', 'first');
for i=1:length(sutun) 
 [~, sutun]= find(tempP==0);
 tempP(:,sutun(1)) = [] ;
end


sortedUValue = sort(tempP(1,:));
firstThreeValues = sortedUValue(1,1:3);
tempArray2 = [];

for i = 1:6
    temp = tempP(:,i);
    for j = 1:3
        if firstThreeValues(j) == temp(1)
            tempArray2 = cat(2,tempArray2,tempP(:,i));
            tempP(:,i)=[0;0];
        end
    end
end


[~, sutun]= find(tempP==0);
sutun = unique(sutun, 'rows', 'first');
for i=1:length(sutun) 
 [~, sutun]= find(tempP==0);
 tempP(:,sutun(1)) = [] ;
end

tempArray = cat(2,tempArray,tempArray2);

sortedUValue = sort(tempP(1,:));
firstThreeValues = sortedUValue(1,1:3);
tempArray2 = [];

for i = 1:3
    temp = tempP(:,i);
    for j = 1:3
        if firstThreeValues(j) == temp(1)
            tempArray2 = cat(2,tempArray2,tempP(:,i));
            tempP(:,i)=[0;0];
        end
    end
end

tempArray = cat(2,tempArray,tempArray2);




p1 = tempArray(:,1);
p2 = tempArray(:,2);
p3 = tempArray(:,3);
p4 = tempArray(:,4);
p5 = tempArray(:,5);
p6 = tempArray(:,6);
p7 = tempArray(:,7);
p8 = tempArray(:,8);
p9 = tempArray(:,9);

q1 = [19.5 ; 367.5];
q2 = [19.5 ; 193.5];
q3 = [19.5 ; 19.5];
q4 = [193.5 ; 367.5];
q5 = [193.5 ; 193.5];
q6 = [193.5 ; 19.5];
q7 = [367.5 ; 367.5];
q8 = [367.5 ; 193.5];
q9 = [367.5 ; 19.5];


p = [p1 p2 p3 p4 p5 p6 p7 p8 p9];
q = 3*[q1 q2 q3 q4 q5 q6 q7 q8 q9];
homographyMatrix = homography(p,q);
newImage = homwarp(homographyMatrix,image,'full');
newImage = flip(newImage,2);
newImage = irotate(newImage,pi);
idisp({newImage,image})




















