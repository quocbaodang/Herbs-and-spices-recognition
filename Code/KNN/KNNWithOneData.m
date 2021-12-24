%nhan dang bang phuong phap KNN
% Quoc Bao Dang
data=xlsread('train.xlsx');
format long
knn=input('Nhap k= ');
disp('Chon mot anh: ');
[image, path] = uigetfile('*.*','Select');
list = strcat(path, image);
d=zeros(1,400);
label=zeros(1,400);
B=zeros(1,knn);
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
test = hu_moments_vector_norm;

for j=1:400
       d(j) = abs(test(1,1)- data(j,1)) + abs(test(1,2)- data(j,2))+abs(test(1,3)- data(j,3))+ abs(test(1,4)- data(j,4))+abs(test(1,5)- data(j,5)) +abs(test(1,6)- data(j,6))+ abs(test(1,7)- data(j,7));
        label(j)=data(j,8);
    end
    
    for k=1:400
        for l =1:400
            if d(k)<d(l)
                tg=d(k);
               d(k)=d(l);
               d(l)=tg;
               la=label(k);
               label(k)=label(l);
               label(l)=la;
            end
        end
    end
    for k=1:knn
        B(k)=label(k);
    end
    kq=zeros(1,5);
    for j=1:knn
       if B(j)==1 kq(1)=kq(1)+1; end
       if B(j)==2 kq(2)=kq(2)+1; end
       if B(j)==3 kq(3)=kq(3)+1; end
       if B(j)==4 kq(4)=kq(4)+1; end
       if B(j)==5 kq(5)=kq(5)+1; end
    end

    kqmax = max(kq);
    for j=1:5
       if kqmax==kq(j)
          vitri=j;
       end
    end
    
if vitri==1 disp('Garlic'); end
if vitri==2 disp('Chilli'); end
if vitri==3 disp('Ginger'); end
if vitri==4 disp('Onion'); end
if vitri==5 disp('Lemongrass'); end