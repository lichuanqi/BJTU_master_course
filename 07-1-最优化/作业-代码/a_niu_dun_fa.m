clc;clear;close;

syms x1 x2;
fx=(x1-2)^4+(x1-2*x2)^2;
v=[x1,x2];
df=jacobian(fx,v);
df=df.';
ddf=jacobian(df,v);

e=0.04;x0=[0,3]';k=0;

g1=subs(df,{x1,x2},{x0(1,1),x0(2,1)});
g2=subs(ddf,{x1,x2},{x0(1,1),x0(2,1)});

while norm(g1) > e
    x0=x0-inv(g2)*g1;
    g1=subs(df,{x1,x2},{x0(1,1),x0(2,1)});
    g2=subs(ddf,{x1,x2},{x0(1,1),x0(2,1)});
    k=k+1;
    fprintf('µü´ú´ÎÊý:%d,x1=%f,x2=%f\n',k,eval(x0(1,1)),eval(x0(2,1)));
end

