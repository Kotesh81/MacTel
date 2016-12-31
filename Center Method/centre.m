function [xcentre,ycentre] =  centre(files,folder)
% Finding centre coordinates of Macula.

files = cellstr(files);

fname =fullfile(folder,files{1});   % Macula Centre is calculated for the first layer i.e. Superficial Retina. 

im_ab = imread(fname);  

if size(im_ab,1) ~= 320 && size(im_ab,2) ~= 320
    im_ab = imresize((im_ab), [320 320]);
end

im = im_ab;

im = imadjust(im,[0 0.2],[0.8 1]);
im = imgaussfilt(im,4);
H  =  fspecial('disk',10);
im = imfilter(im,H,'replicate');

im = imsharpen(im,'Radius', 10,'Amount', 2);

im = im2bw(im, 0.85);
im = medfilt2(im, [3 3]);

im_bw = imcomplement(im);

s = regionprops(im_bw, 'Area', 'BoundingBox');
areas = [s.Area].';
s2 = s(areas > 100);

out = false(size(im_bw));

for idx = 1 : numel(s2)                 %// For each potential circle we have...
    bb = floor(s2(idx).BoundingBox);     %// Could be floating point, so floor it
    %// Copy over pixels from original bw image to output
    out(bb(2):bb(2)+bb(4)-1, bb(1):bb(1)+bb(3)-1) = im_bw(bb(2):bb(2)+bb(4)-1, bb(1):bb(1)+bb(3)-1);
end


%// Image that contains all of our final circles
out2 = false(size(im_bw));
[X,Y] = meshgrid(1:size(im_bw,2), 1:size(im_bw,1)); %// Find a 2D grid of co-ordinates

for idx = 1 : numel(s2) %// For each circle we have...
   bb = floor(s2(idx).BoundingBox); %// Could be floating point, so floor it

   cenx = bb(1) + (bb(3) / 2.0); %// Get the centre of the bounding box
   ceny = bb(2) + (bb(4) / 2.0);

   radi = max(bb(3), bb(4)) / 2; %// Find the best radius
   tmp = ((X - cenx).^2 + (Y - ceny).^2) <= radi^2; %// Draw our circle and place in a temp. image
   out2 = out2 | tmp; %// Add this circle on top of our output image
end


[c,r] = imfindcircles(out2,[10,30]);         %display detected circles


[centers, radii] = imfindcircles(out2,[10 30],'ObjectPolarity','dark', ...
    'Sensitivity',0.96);

h = viscircles(centers,radii);
viscircles(c,r);

xcentre = c(1); % xcentre = x-coordinate of centre

ycentre = c(2); % ycentre = y-coordinate of centre

fprintf('\nCentre of Macula  =  %f,%f\n',c(1),c(2));

fprintf('\n');

end


