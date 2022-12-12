function [outputArg1] = coordinateDetector(homographyMatrix,p)
    
    outputArg1 = homtrans(homographyMatrix,p)/20;
end

