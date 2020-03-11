% Ŀ�꺯����fx
% ��ֵ������˵㣺a
% ��ֵ�����Ҷ˵㣺b
% cΪ�е㣬x_1Ϊ��ȡ�㣬x_2Ϊ��ȡ��
% ��ȡ����ȡ���ƫ��ֵ eps
% ���ȣ� delta
% ����ֵʱ�ı�����x0
% ����ֵ�� minf

clc;
close all;
clear all;

syms x;
fx=8*x^3-2*x^2-7*x+3;
a=0;b=1;
eps=0.1;
delta=0.0001;

x0=(a+b)/2;
pre_f_x0=100;
f_x0=subs(fx,findsym(fx),x0);
k=0;
disp(sprintf('k=%d,x0=%.4f,f(x0)=%.4f\n',k,x0,eval(f_x0)));
while abs(f_x0-pre_f_x0)>=delta
    k=k+1;
    c=(a+b)/2;
    x1=c-eps/2;
    x2=c+eps/2;
    f_x1=subs(fx,findsym(fx),x1);
    f_x2=subs(fx,findsym(fx),x2);
    if f_x1>f_x2
       a=x1; 
    else
       b=x2;
    end
    
    x0=(a+b)/2;
    pre_f_x0=f_x0;
    f_x0=subs(fx,findsym(fx),x0);
    disp(sprintf('k=%d,x0=%.4f,f(x0)=%.4f\n',k,x0,eval(f_x0)));       
end

