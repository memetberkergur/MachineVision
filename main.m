clc;
clear;

fileName = "images/IMG_6879.JPEG";
[image,meta] = iread(fileName,'double');
colorSelector = 3;
shapeSelector = 3;
sizeSelector = 1;
%colorSelector = menu('Lütfen Renk Seçiniz',"Kırmızı","Yeşil","Mavi");
newImage = colorDetector(image,colorSelector);
%shapeSelector = menu("Lütfen Bir Şekil Seçiniz","Kare","Üçgen","Daire");
newImage = shapeDetector(newImage,shapeSelector);
%sizeSelector = menu("Lütfen Bir Boyut Seçiniz","En Büyük","En Küçük");
p = sizeDetector(newImage,sizeSelector);
plot_circle(p,30,'fillcolor','#FF66B2','alpha',0.3)


coordinate = coordinateDetector(p);
fprintf('Seçilen Nesnenin Gerçek Koordinatı = %d',coordinate);
