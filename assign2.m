clc
clear all
A=[2 3 -1 4;1 2 6 -7];
B=[8;-3];
C=[2 3 4 7];
m=size(A,1);
n=size(A,2);
  if n>m
nCm=nchoosek(n,m)
pair=nchoosek(1:n,m)
  else
   fprint('ERROR');
   end
   sol=[];
   for i=1:nCm
       y=zeros(n,1)
       A1=A(:,pair(i,:))
       x=inv(A1)*B;
       
       if(x>=0 & x~=inf)
           y(pair(i,:))=x;
           sol=[sol y];
       end
   end
   z=C*sol
   max(z)
   sol(:,3)
   
    
    
    
    