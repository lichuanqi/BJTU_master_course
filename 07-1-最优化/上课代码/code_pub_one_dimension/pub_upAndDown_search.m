

clc;
clear all;
close all;


syms x;
fx=x^4-x^2-2*x+5;
h=0.1;
x0=0;

k=0;
x1=x0;
while 1
    k=k+1;
    x4=x1+h;
    f4=subs(fx,findsym(fx),x4);
    f1=subs(fx,findsym(fx),x1);
    
    if f4<f1 
       x2=x1;f2=f1;
       x1=x4;f1=f4;
       h=2*h;
    else  %%%fxh>=fx0
       if k==1
          h=-h;
          x2=x4;f2=f4;
       else
          x3=x2;
          x2=x1;
          x1=x4;
          h=h/2;
          break;
       end
    end
end

a=min(x1,x3)
b=x1+x3-a

    
    
