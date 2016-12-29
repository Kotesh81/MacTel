function start_process_320(files,folder)
files = cellstr(files);
for i = 1:length(files)
fname =fullfile(folder,files{i});    
im_ab = imread(fname);
    
if size(im_ab,1) ~= 320 && size(im_ab,2) ~= 320
    im_ab = imresize((im_ab), [320 320]);
end

im_ab = rgb2gray(im_ab);

 binary = im2bw(im_ab);

area(i) = bwarea(binary);
fprintf('%f\n', area(i));
final_area = num2str(area(i));
fprintf ('%s\n', final_area);

fprintf('\n');

end



z= xlsread('Report_320.xlsx');
[m,n] = size(z);
j = m + 1;
k = num2str(m+1);

c = strcat ('A', k);
d = strcat ('B', k);
e = strcat ('C', k);
f = strcat ('D', k);

   
xlswrite('Report_320.xlsx',area(1),1,c);
xlswrite('Report_320.xlsx',area(2),1,d);
xlswrite('Report_320.xlsx',area(3),1,e);
xlswrite('Report_320.xlsx',area(4),1,f);
clear m,n,j,k;
close;
 


end












    
    