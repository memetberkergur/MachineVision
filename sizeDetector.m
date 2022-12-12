function [outputArg1] = sizeDetector(image,sizeSelector)
    
    [~,maxlabel,~,class] = ilabel(image);
    blobs = iblobs(image,'class',1,'boundary');
    for i = 1:maxlabel
        if class(i) == 1 
            for j = 1:numel(blobs)
                if blobs(j).area_ == max(blobs.area) && sizeSelector == 1
                    p = blobs(j).p;
                elseif blobs(j).area_ == min(blobs.area) && sizeSelector == 2
                    p = blobs(j).p;
                end
            end
        end
    end
    outputArg1 = p;
end

