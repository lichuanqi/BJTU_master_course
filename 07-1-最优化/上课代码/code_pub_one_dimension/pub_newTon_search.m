

clc;
clear all;
close all;

syms x;
fx=8*x^3-2*x^2-7*x+3;
delta=0.001;
x0=1;
fx0=subs(fx,symvar(fx),x0);

df=diff(fx);
d2f=diff(df);
k=0;
v_df=subs(df,symvar(df),x0);
disp(sprintf('k=%d,x=%.4f,fx=%.4f\n',k,x0,eval(fx0)));
while v_df>delta
    k=k+1;
    v_df=subs(df,symvar(df),x0);
    v_d2f=subs(d2f,symvar(d2f),x0);
    
    x0=x0-v_df/v_d2f;
    
    fx0=subs(fx,symvar(fx),x0);
    disp(sprintf('k=%d,x=%.4f,fx=%.4f\n',k,eval(x0),eval(fx0)));  
end
 
