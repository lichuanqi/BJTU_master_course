% 目标函数：fx
% 极值区间左端点：a
% 极值区间右端点：b
% 精度： delta
% 最优值时的变量：x0
% 最优值： minf

clc;
close all;
clear all;

syms x;
fx=8*x^3-2*x^2-7*x+3;
a=0;b=1;
delta=0.0001;

x0=a;
f_x0=subs(fx,findsym(fx),x0);
pre_f_x0=999;
k=0;
disp(sprintf('k=%d,x=%.4f,fx=%.4f\n',k,x0,eval(f_x0)));

while abs(f_x0-pre_f_x0)>delta
    k=k+1;
    x1=a+(b-a)/4;
    x2=a+2*(b-a)/4;
    x3=a+3*(b-a)/4;
    f_x1=subs(fx,findsym(fx),x1);
    f_x2=subs(fx,findsym(fx),x2);
    f_x3=subs(fx,findsym(fx),x3);
    if f_x1<=f_x2 & f_x1<=f_x3
        b=x2;x0=x1;
    elseif f_x2<=f_x1 & f_x2<=f_x3
        a=x1;b=x3; x0=x2;   
    elseif f_x3<=f_x1 & f_x3<=f_x2
        a=x2;x0=x3;
    end
    
    pre_f_x0=f_x0;
    f_x0=subs(fx,findsym(fx),x0);
    disp(sprintf('k=%d,[%.2f-%.2f],x=%.4f,fx=%.4f\n',k,a,b,x0,eval(f_x0)));    
end
    

