


clc;
clear all;
close all;

syms x;
fx=x^2-6*x+2;
a=0;b=10;
delta=0.3;

x0=(a+b)/2;
f_x0=subs(fx,findsym(fx),x0);
k=0;
disp(sprintf('k=%d,[%.4f-%.4f],x=%.4f,fx=%.4f\n',k,a,b,x0,eval(f_x0)));

while b-a>delta
    k=k+1;
    L=0.618*(b-a);
    x1=b-L;
    x2=a+L;
    f_x1=subs(fx,findsym(fx),x1);
    f_x2=subs(fx,findsym(fx),x2);
    if f_x1>f_x2
        a=x1;
    else
        b=x2;
    end
    
    x0=(a+b)/2;
    f_x0=subs(fx,findsym(fx),x0);
    disp(sprintf('k=%d,[%.4f-%.4f],x1=%.2f,x2=%.2f,fx1=%.2f,fx2=%.2f,delta=%.2f,x=%.4f,fx=%.4f\n',k,a,b,x1,x2,eval(f_x1),eval(f_x2),abs(b-a),x0,eval(f_x0)));    
    
end