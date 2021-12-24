%nhan dang bang phuong phap so khop mau
A=xlsread('train.xlsx');
[image, path] = uigetfile('*.*','Select');
list = strcat(path, image);
M = zeros(1,7);
img = imread(list);
img=rgb2gray(img);
    T=graythresh(img);
    [m,n]=size(img)
    for i=1:m
        for j=1:n
            if img(i,j)>=T*255 img(i,j)=0;
            else img(i,j)=255;
            end
        end
    end
img=imresize(img,[50 50]);
img=logical(img);
hu_moments_vector_norm = run(img);
M = hu_moments_vector_norm;
d=zeros(1,400);
for i=1:400
    d(i)=sqrt((A(i,1)-M(1))^2+(A(i,2)-M(2))^2+(A(i,3)-M(3))^2+(A(i,4)-M(4))^2+(A(i,5)-M(5))^2+(M(6)-A(i,6))^2+(M(7)-A(i,7))^2);
end
dmin=min(d);
for i=1:400;
    if dmin==d(i) ketqua=A(i,8);
    end
end
if ketqua==1 disp('Garlic'); end
if ketqua==2 disp('Chilli'); end
if ketqua==3 disp('Ginger'); end
if ketqua==4 disp('Onion'); end
if ketqua==5 disp('Lemongrass'); end
