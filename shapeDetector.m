function [outputArg1] = shapeDetector(image,shapeSelector)
    s=ones(15,15);
    image = ierode(image,s);
    [L,maxlabel,~,class] = ilabel(image);
    tempImage = 0;
    for i = 1:maxlabel
        if class(i) == 1
            blobs = iblobs((L==i),'class',1,'boundary');
            % Square
            if blobs.circularity_ > 0.85 && blobs.circularity_ < 1 && shapeSelector == 1
                tempImage = tempImage + (L==i);
            % Triangle
            elseif blobs.circularity_ < 0.85 && shapeSelector ==2
                tempImage = tempImage + (L==i);
            % Circle
            elseif blobs.circularity_ > 0.99 && shapeSelector ==3
                tempImage = tempImage + (L==i);
            end
        end
    end

    outputArg1 = tempImage;

end

