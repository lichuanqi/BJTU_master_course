clc;clear;close;

syms a1 a2 k t;
var=[a1,a2];
fx=-a1^2+6*a1-a2^2+8*a2;
g1=a1-4;
g2=2*a2-12;
g3=3*a1+2*a2-18;
g4=-a1;
g5=-a2;
x0=[0,0]; 
e1=[1,0];   
e2=[0,1];
h=0.2;   
delta=0.01; 
y=x0;
s=0;
f_x000=subs(fx,var,x0);
fprintf('s=%d,x=[%.4f,%.4f],fx=%.4f\n\n',s,x0(1),x0(2),eval(f_x000));

while h>delta
    s=s+1;
    t=h;
    y3=y;
    jugde=1;
    forward=1;
    while jugde==1
    y1=y+t*e1;
    fxy0=subs(fx,var,y);
    fxy1=subs(fx,var,y1);g10=subs(g1,var,y1);g20=subs(g2,var,y1);g30=subs(g3,var,y1);g40=subs(g4,var,y1);g50=subs(g5,var,y1);
        if  fxy1 > fxy0 && g10<=0 && g20<=0 && g20<=0 && g20<=0 && g20<=0
             y=y1;
             t=2*t;
             forward=0;
        else 
            jugde=0;
        end  
    end
    jugde=1;
    if forward==1
        while jugde==1 
        y1=y-t*e1;
        fxy0=subs(fx,var,y);
        fxy1=subs(fx,var,y1);g10=subs(g1,var,y1);g20=subs(g2,var,y1);g30=subs(g3,var,y1);g40=subs(g4,var,y1);g50=subs(g5,var,y1);
            if  fxy1 > fxy0 && g10<=0 && g20<=0 && g20<=0 && g20<=0 && g20<=0
                y=y1;
                t=2*t;
            else 
                jugde=0;
            end  
        end 
    end
    upward=1;
    jugde=1;
    t=h;
    while jugde==1
    y1=y+t*e2;
    fxy0=subs(fx,var,y);
    fxy1=subs(fx,var,y1);g10=subs(g1,var,y1);g20=subs(g2,var,y1);g30=subs(g3,var,y1);g40=subs(g4,var,y1);g50=subs(g5,var,y1);
        if  fxy1 > fxy0 && g10<=0 && g20<=0 && g20<=0 && g20<=0 && g20<=0
             y=y1;
             t=2*t;
             upward=0;
        else 
            jugde=0;
        end  
    end
    jugde=1;
    if forward==1
        while jugde==1 
        y1=y-t*e2;
        fxy0=subs(fx,var,y);
        fxy1=subs(fx,var,y1);g10=subs(g1,var,y1);g20=subs(g2,var,y1);g30=subs(g3,var,y1);g40=subs(g4,var,y1);g50=subs(g5,var,y1);
            if  fxy1 > fxy0 && g10<=0 && g20<=0 && g20<=0 && g20<=0 && g20<=0
                y=y1;
                t=2*t;
            else 
                jugde=0;
            end  
        end 
    end
    
    f_x000=subs(fx,var,y);
    if y3==y
        h=h/2;
    end
    fprintf('s=%d,x=[%.4f,%.4f],f_000=%.4f,tol=%4f\n\n',s,y(1),y(2),eval(f_x000),h);
end