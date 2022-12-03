function [outputArg1] = colorDetector(image,colorSelector)
    limg = igamm(image,2.3);
    [r,g] = tristim2cc(limg);
    r = greySmooth(r,5);
    g = greySmooth(g,5);
    switch colorSelector
        case 1
            % Red Thresh
            image = r > 0.54;
        case 2
            % Green Thresh
            image = g > 0.45;
        case 3 
            % Blue Thresh
            image = r < 0.23;
    end
    image = greySmooth(image,5);
    outputArg1 = image;
end

