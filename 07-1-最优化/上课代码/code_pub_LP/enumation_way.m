

clc;

C=[-3;
   -2;
   0;
   0];
A=[1,1,1,0;
   2,1,0,1];
b=[40;
   60];

[m,n]=size(A);

[x,z]=linprog(C,A,b);
v=1:n;
result=combntns(v,2);
for i=1:length(result)
    Bv=result(i,:);
    B=A(:,Bv(1:m));
    x=B^-1*b;    
    display(sprintf('n=%d,x=[x%d,x%d]=[%.4f,%.4f]',i,Bv(1),Bv(2),x(1),x(2)));
end
