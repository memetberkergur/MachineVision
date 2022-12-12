function [outputArg1] = colorDetector(image,colorSelector)
    limg = igamm(image,'sRGB');
    [r,g] = tristim2cc(limg);
    r = greySmooth(r,10);
    g = greySmooth(g,10);
    switch colorSelector
        case 1
            % Red Thresh
            image = r > 0.53;
        case 2
            % Green Thresh
            image = g > 0.40;
        case 3 
            % Blue Thresh
            image = r < 0.28;
    end

    % Boşlukları doldurmak için
    image(1:10,:)=0;
    image(:,1:10)=0;
    image(end:-1:(end-10),:)=0;
    image(:,end:-1:(end-10))=0;
    outputArg1 = image;
end

