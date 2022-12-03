function [outputArg1] = shapeDetector(image,shapeSelector)
    
    [L,maxlabel,~,class] = ilabel(image);
    tempImage = 0;
    for i = 1:maxlabel
        if class(i) == 1
            blobs = iblobs((L==i),'class',1,'boundary');
            for j = 1:numel(blobs)
            
                x = (blobs(j).vmax)-(blobs(j).vmin);
                y = (blobs(j).umax)-(blobs(j).umin);
                realArea = (x+1)*(y+1);
                shapePikselArea = blobs(j).area;
                circularityShape = shapePikselArea/realArea;

                % Square
                if shapeSelector == 1 && circularityShape > 0.9
                    tempImage = tempImage + (L==i);
                % Triangle
                elseif shapeSelector == 2 && circularityShape < 0.6
                    tempImage = tempImage + (L==i);
                % Circle
                elseif shapeSelector == 3 && circularityShape < 0.9 && circularityShape > 0.70
                    tempImage = tempImage + (L==i);
                end
    
            end
        end
    end
    

    outputArg1 = tempImage;

end

