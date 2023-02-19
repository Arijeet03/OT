clc
clear all;
A=[1 -2 -3;2 3 -4;1 1 1];
B=[4;5;2];
C=[1 2 -1 0 0 0];
S=eye(size(A,1));
Inequ=[0 0 1];
index=find(Inequ>0);
S(index,:)=-S(index,:);
mat=[A S B]
mat2=[A S];
cons=array2table(mat,'VariableName',{'X1','X2','X3','S1','S2','S3','B'})
n=size(mat2,2);
m=size(mat2,1);
f=nchoosek(n,m);
p=nchoosek(1:n,m)
sol=[];
for i=1:f
    y=zeros(n,1);
    A1=mat2(:,p(i,:))
    X=inv(A1)*B
    if all(X>=0 & X~=inf)
        y(p(i,:))=X
        sol=[sol y]
    end
end
z=sol'*C'
[obj index]=max(z)
Y=sol(index,:)
optval=[Y obj]


