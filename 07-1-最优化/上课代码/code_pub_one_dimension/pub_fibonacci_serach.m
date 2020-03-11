
clc;
clear all;
close all;

syms x;
fx=x^2-x+2;
a=-1;b=3;
delta=0.5;

x0=(a+b)/2;
f_x0=subs(fx,findsym(fx),x0);
k=0;
disp(sprintf('k=%d,x=%.4f,fx=%.4f\n',k,x0,eval(f_x0)));
Fn=ceil((b-a)/delta);

%ÏÈÈ·¶¨N

F=ones(1,2);
n=2;
while 1
   n=n+1;
   F(n)=F(n-1)+F(n-2);
   if F(n)>=Fn
       break;
   end
end

L1=b-a;
L2=L1*F(n-1)/F(n);
x1=b-L2;
x2=a+L2;
for k=1:n-1
      
    fx1=subs(fx,findsym(fx),x1);
    fx2=subs(fx,findsym(fx),x2);
    if fx1<fx2
       b=x2;
       x2=x1;
       x1=a+b-x2;
    elseif fx1==fx2
        a=x1;
        b=x2;
    else
       a=x1;
       x1=x2;
       x2=b-(x1-a);
    end
    
    x0=(x1+x2)/2;
    f_x0=subs(fx,findsym(fx),x0);
    disp(sprintf('k=%d,[%.2f,%.2f],x=%.4f,fx=%.4f\n',k,a,b,x0,eval(f_x0)));
        
end
