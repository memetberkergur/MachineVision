clc;
clear;

addpath(genpath('corke_toolbox\corke_toolbox'));
fileName = "images/IMG_6879.JPEG";
[image,meta] = iread(fileName,'double');

% Ön tanımlı değerler
colorSelector = 3;
shapeSelector = 3;
sizeSelector = 1;

% Orjinal Görüntü 
idisp(image)
pause(2)

% Düzeltilmiş görüntü
[newImage,~] = getCalibration(image);
[newImage,homographyMatrix] = getCalibration(newImage);
idisp(newImage)

% Renklerin Ayrıştırılması
colorSelector = menu('Lütfen Renk Seçiniz',"Kırmızı","Yeşil","Mavi");
newImage = colorDetector(newImage,colorSelector);
idisp(newImage)

% Şekillerin Tespiti
shapeSelector = menu("Lütfen Bir Şekil Seçiniz","Kare","Üçgen","Daire");
newImage = shapeDetector(newImage,shapeSelector);
idisp(newImage)

% Boyut Tespiti
sizeSelector = menu("Lütfen Bir Boyut Seçiniz","En Büyük","En Küçük");
p = sizeDetector(newImage,sizeSelector);
plot_circle(p,30,'fillcolor','g','alpha',0.6)

%Gerçek Koordinatların Ekranda Gösterilmesi
reelAxes = coordinateDetector(homographyMatrix,p);
fprintf('\nX ekseni = %.2f cm \nY ekseni = %.2f cm',reelAxes(1),reelAxes(2))

% % Robotun Çalıştırılması
%startRobot(reelAxes(1),reelAxes(2),colorSelector,'COM4');


