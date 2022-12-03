function simg = greySmooth(img, n) 
% convert the image with imono
grey = imono(img); 
% create kernel
K = ones(n,n) / n^2; 
% perform convolution
simg = iconv(K, grey); 
end