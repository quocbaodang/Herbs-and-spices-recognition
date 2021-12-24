%nhan dang bang phuong phap so khop mau
A=xlsread('train.xlsx');
M=xlsread('testlemongrass_5.xlsx'); % chon file test


d=zeros(1,400);
B=zeros(1,5);
for k=1:length(M)
    for i=1:400
        d(i)=sqrt((A(i,1)-M(k,1))^2+(A(i,2)-M(k,2))^2+(A(i,3)-M(k,3))^2+(A(i,4)-M(k,4))^2+(A(i,5)-M(k,5))^2+(M(k,6)-A(i,6))^2+(M(k,7)-A(i,7))^2);
    end
dmin=min(d);
for i=1:400;
    if dmin==d(i) ketqua=A(i,8);
    end
end
        if ketqua==1 B(1,1)=B(1,1)+1;   % garlic
        end
        if ketqua==2 B(1,2)=B(1,2)+1;   % chilli
        end
        if ketqua==3 B(1,3)=B(1,3)+1;   % ginger
        end
        if ketqua==4 B(1,4)=B(1,4)+1;   % onion
        end
        if ketqua==5 B(1,5)=B(1,5)+1;   % lemongrass
        end
 
end
B