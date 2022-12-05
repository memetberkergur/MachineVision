clc;
clear;

fileName = "images/IMG_6879.JPEG";
[image,meta] = iread(fileName,'double');
colorSelector = 2;
shapeSelector = 3;
sizeSelector = 1;



% İçeri aktarılan görüntünün renklerine ayrıştırılması
%colorSelector = menu('Lütfen Renk Seçiniz',"Kırmızı","Yeşil","Mavi");
newImage = colorDetector(image,colorSelector);

% Renklerine ayrıştırılan görüntünün içerisinden nesnelerin seçimi
%shapeSelector = menu("Lütfen Bir Şekil Seçiniz","Kare","Üçgen","Daire");
newImage = shapeDetector(newImage,shapeSelector);

% Seçilen nesnelerin boyutlarının belirlenmesi
% sizeSelector = menu("Lütfen Bir Boyut Seçiniz","En Büyük","En Küçük");

idisp(newImage)
p = sizeDetector(newImage,sizeSelector);
plot_circle(p,30,'fillcolor','#FF66B2','alpha',0.3)

% Seçilen nesne için gerçek koordinatlarının hesaplanması
[xAxes,yAxes] = coordinateDetector(p);
fprintf('Seçilen Nesnenin Gerçek Koordinatı ; \n\t x=%d \n\t y=%d',xAxes,yAxes);
