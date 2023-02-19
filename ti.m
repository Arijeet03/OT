clc;
clear all;
A=[-1 3;1 1;1 -1];
B=[10;6;2];
c=[2 3];
x1=0:1:max(B);
x12=(B(1)-A(1,1)*x1)/A(1,2);
x22=(B(2)-A(2,1)*x1)/A(2,2);
x32=(B(3)-A(3,1)*x1)/A(3,2);
x12=max(0,x12);
x22=max(0,x22);
x32=max(0,x32);
plot(x1,x12,'r',x1,x22,'b',x1,x32,'g')
cx1=find(x1==0)
c1=find(x12==0)
line1=[x1([cx1 c1]);x12([cx1 c1])]
c2=find(x22==0)
line2=[x1([cx1 c2]);x22([cx1 c2])]
c3=find(x32==0)
line3=[x1([cx1 c3]);x32([cx1 c3])]
coe=unique([line1,line2,line3],'rows')'
pt=[0;0]
for i=1:size(A,1)
    A1=A(i,:);
    B1=B(i,:);
    for j=i+1:size(A,1)
        A2=A(j,:);
        B2=B(j,:);
        A4=[A1;A2];
        B4=[B1;B2];
        X=A4\B4;
        pt=[pt X];
    end
end
pt
x=pt';
poin=[coe;x];
all=unique(poin,'rows')
for i=1:size(pt,1)
    cons1(i)=A(1,1)*pt(i,1)+A(1,2)*pt(i,2)-B(1);
    s1=find(cons1>=0);
      cons2(i)=A(2,1)*pt(i,1)+A(2,2)*pt(i,2)-B(2);
    s2=find(cons2>=0);
      cons3(i)=A(3,1)*pt(i,1)+A(3,2)*pt(i,2)-B(3);
    s3=find(cons3>=0);
end
%end
S=unique([s1,s2,s3])
poin(S,:)=[]