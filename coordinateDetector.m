function [outputArg1,outputArg2] = coordinateDetector(point)
%COORDİNATEDETECTOR Summary of this function goes here
%   Detailed explanation goes here
    proportion = 0.0373;
    x = 236.6881;
    y = 1640.8;
    x = point(1)-x;
    y = y-point(2);
    x = proportion*x;
    y = proportion*y;
    outputArg1 = x;
    outputArg2 = y;
end

