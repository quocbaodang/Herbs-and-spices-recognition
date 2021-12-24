clc;
close all;
clear;
[image, path] = uigetfile('*.*','Select','MultiSelect','on');
list = strcat(path, image);
[ignore, len] = size(list);
Matrix_hu_moments = zeros(400,8);
for i=1:len
    img = imread(list{1,i});
    hu_moments_vector_norm = run(img);
    Matrix_hu_moments(i,1:7) = hu_moments_vector_norm;
    Matrix_hu_moments(i,8) = 2;

end
xlswrite('mydata.xlsx', Matrix_hu_moments,2);

