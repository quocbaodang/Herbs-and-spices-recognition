
%nhan dang bang phuong phap KNN
%Quoc Bao Dang

% Y tuong:
   % -Tu mot du lieu test ta tinh khoang cach tu diem do den 400 du lieu
   % trong tap train, sau do luu vao trong mang d 1x400, dong thoi luu l?i
   % cac label tuong ung vao mang label 1x400
   %- Sap xep mang d theo thu tu tu be den lon kem theo label tuong ung
   %trong mang label
   %- Lay ra K gia tri dau cua mang label, no chinh la K gia tr? label cua
   %K vi tri co khoang cach nho nhat luu vao mang B 1xK
   %- Dem so lan xuat hien cua cac loai label trong mang B, luu no vao mang
   %kq 1x5 (vi co 5 class)
   %- Tim so lon nhat trong mang kq, vi tri so lon nhat chinh la label cua
   %du lieu test do
   
data=xlsread('train'); %file train
test=xlsread('testgarlic_1'); % chon file test
format long

d=zeros(1,400);
label=zeros(1,400);
knn=5;    % Chon k
B=zeros(1,knn);
A=zeros(1,5);

for i=1:length(test)
    % Tinh khoang cach
    for j=1:400
       d(j) = abs(test(i,1)- data(j,1)) + abs(test(i,2)- data(j,2))+abs(test(i,3)- data(j,3))+ abs(test(i,4)- data(j,4))+abs(test(i,5)- data(j,5)) +abs(test(i,6)- data(j,6))+ abs(test(i,7)- data(j,7));
        label(j)=data(j,8);
    end
    %Sap xep tu be den lon theo khoang cach va cac label tuong ung
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
    % Lay knn label co khoang cach nho nhat
    for k=1:knn
        B(k)=label(k);
    end
    kq=zeros(1,5); % Mang luu so cac label cua knn diem gan nhat
    for j=1:knn
       if B(j)==1 kq(1)=kq(1)+1; end
       if B(j)==2 kq(2)=kq(2)+1; end
       if B(j)==3 kq(3)=kq(3)+1; end
       if B(j)==4 kq(4)=kq(4)+1; end
       if B(j)==5 kq(5)=kq(5)+1; end
    end
    % Tim max so label cac diem lan can
    kqmax = max(kq);
    for j=1:5
       if kqmax==kq(j)
          vitri=j;
       end
    end
       
   if vitri==1 A(1)= A(1)+1; end
   if vitri==2 A(2)= A(2)+1; end
   if vitri==3 A(3)= A(3)+1; end
   if vitri==4 A(4)= A(4)+1; end
   if vitri==5 A(5)= A(5)+1; end
end
A


