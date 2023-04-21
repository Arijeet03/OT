clc
clear all
c=[6 4 1 5; 8 9 2 7 ;4 3 6 4]  %represents the matrix of TP
b=[7 5 3 2]     %bottommost row
a=[6 1 10]      %rightmost row    
m=size(c,1)
n=size(c,2)
if sum(a)==sum(b)
    fprintf('Given Transportation Problem is balanced');
else
    fprintf('Given Transportation Problem is unbalanced');
    if sum(a)<sum(b)
        c(end+1,:)=zeros(1,length(b))
        a(end+1)=sum(b)-sum(a)
    elseif sum(a)>sum(b)
        c(:,end+1)=zeros(1,length(a))
        b(end+1)=sum(a)-sum(b)
    end
end
x =zeros(m,n)
initialc= c;
for i=1:size(c,1)
    for j=1:size(c,2)
        cpq=min(c(:))
        if cpq==inf
            break
        end
        [p1,q1]=find(cpq==c)
        xpq=min(a(p1),b(q1));
        [x(p1,q1) ,ind]= max(xpq);
        p=p1(ind);
        q=q1(ind);
        x(p,q)=min(a(p), b(q))
        if x(p,q)==a(p)
            a(p)=a(p)-x(p,q);
            b(q)=b(q)-a(p);
            c(p,:)=inf
        else x(p,q)==b(q)
            a(p)=a(p)-b(q)
            b(q)=b(q)-x(p,q);
            c(:,q)=inf;
        end
    end
end
Z=0;
for i=1:size(c,1)
    	for j=1:size(c,2)
        Z=Z+x(i,j)*initialc(i,j)
end
end
array2table(x)

