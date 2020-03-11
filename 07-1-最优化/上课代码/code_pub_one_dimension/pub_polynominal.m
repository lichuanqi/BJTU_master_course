clc;


syms x;
fx=8*x^3-2*x^2-7*x+3;
fx=exp(x)-5*x;

x0=1;
x1=x0+1;

fx0=subs(fx,findsym(fx),x0);
fx1=subs(fx,findsym(fx),x1);

lamder=1;
if fx1<fx0  %%double lamder
    fxh=fx1;
    while fxh<fx0
        lamder=2*lamder;
        xh=x0+lamder;
        fxh=subs(fx,findsym(fx),xh);
    end    
else    %%% divide lamder
    fxh=fx1;
    while fxh>fx0
        lamder=lamder/2;
        xh=x0+lamder;
        fxh=subs(fx,findsym(fx),xh);
    end      
end

x1=x0;
x2=(x0+xh)/2;
x3=xh;
y1=eval(subs(fx,findsym(fx),x1));
y2=eval(subs(fx,findsym(fx),x2));
y3=eval(subs(fx,findsym(fx),x3));

%%%%
b=((x2^2-x3^2)*(y1-y2)-(x1^2-x2^2)*(y2-y3))/((x2^2-x3^2)*(x1-x2)-(x1^2-x2^2)*(x2-x3));
a=(y1-y2-b*(x1-x2))/(x1^2-x2^2);
c=y1-a*x1^2-b*x1;

x_opt=-b/(2*a)




