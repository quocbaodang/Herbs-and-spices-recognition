%chuyen anh goc thanh anh xam nen den 50x50
clc;
close all;
clear;
[image, path] = uigetfile('*.*','Select','MultiSelect','on');
list = strcat(path, image);
[ignore, len] = size(list);
for i=1:len
    img = imread(list{1,i});
    ten=image{1,i}(1:7);
    ten=strcat('D:\18DT2\KT NhanDang\AnhXam\',ten,'3.png');
    img=rgb2gray(img);
    T=graythresh(img);
    [m,n]=size(img)
    for i=1:m
        for j=1:n
            if img(i,j)>=T*255 img(i,j)=0;
            else img(i,j) = img(i,j);
            end
        end
    end
img=imresize(img,[50 50]);
imwrite(img,ten);
end