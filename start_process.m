function start_process(files,folder)


[xcentre,ycentre] = centre(files,folder); % Finding Centre value from centre.m file by function calling.


files = cellstr(files);

for i = 1:length(files)
fname =fullfile(folder,files{i});    
im_ab = imread(fname);
    
if size(im_ab,1) ~= 320 && size(im_ab,2) ~= 320
    im_ab = imresize((im_ab), [320 320]);
end

im_ab = rgb2gray(im_ab);  % 

im_ab = imcrop(im_ab,[xcentre-125,ycentre-125,250,250]);  %Taking a patch of 250x250 around macula centre.

binary = im2bw(im_ab); 

imshow (binary);

area(i) = bwarea(binary);

fprintf('%f\n', area(i));


fprintf('\n');
end

z= xlsread('Report_Centre.xlsx');
[m,n] = size(z);
j = m + 1;  
k = num2str(m + 1);
 


c = strcat ('A', k);
d = strcat ('B', k);
e = strcat ('C', k);
f = strcat ('D', k);
g = strcat ('E', k);
h = strcat ('F', k);
   
xlswrite('Report_Centre.xlsx',area(1),1,c);
xlswrite('Report_Centre.xlsx',area(2),1,d);
xlswrite('Report_Centre.xlsx',area(3),1,e);
xlswrite('Report_Centre.xlsx',area(4),1,f);
xlswrite('Report_Centre.xlsx',xcentre,1,g);
xlswrite('Report_Centre.xlsx',ycentre,1,h);
clear k;
close;
 

end












    
    