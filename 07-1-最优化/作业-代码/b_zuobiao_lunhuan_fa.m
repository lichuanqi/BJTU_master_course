clc;clear;close;

syms t1 t2;
e1=[1,0]';
e=0.04;
k=0;
e2=[0,1]';
x0=[0,3]';
x=[inf,inf]';

while norm(x)>e
    x00=x0;
x01=x0+t1*e1;
fx1=(x01(1,1)-2)^4+(x01(1,1)-2*x01(2,1))^2;
df1=diff(fx1,'t1');
t10=vpa(solve(df1),2);
t10=t10(t10==real(t10));
x0=x0+t10*e1;
x02=x0+t2*e2;
fx2=(x02(1,1)-2)^4+(x02(1,1)-2*x02(2,1))^2;
df2=diff(fx2,'t2');
t20=vpa(solve(df2),2);
t20=t20(t20==real(t20));
x0=x0+t20*e2;
x=x0-x00;
k=k+1;
fprintf('µü´ú´ÎÊý:%d,x1=%f,x2=%f\n',k,eval(x0(1,1)),eval(x0(2,1)));
end


