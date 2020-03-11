clc;clear;close;

syms x1 x2
f=(x1-2)^4+(x1-2*x2)^2;

delta=0.5;
alpha=1;
beta=0.5;
maxIter=10;
e1=[1,0];
e2=[0,1];
X=[];
k=0;

for i=1:maxIter
    if i==1
        X(i,:)=[0,3];
        y1=X(i,:);
    end
    fy1=subs(f,{x1,x2},{y1(1),y1(2)});
    y1pe1=y1+delta*e1;
    if subs(f,{x1,x2},{y1pe1(1),y1pe1(2)})<fy1
        y2=y1pe1;
        fy2=subs(f,{x1,x2},{y1pe1(1),y1pe1(2)});
    else
        y2=y1;
        fy2=fy1;
    end
    y1me1=y2-delta*e1;
    if subs(f,{x1,x2},{y1me1(1),y1me1(2)})<fy2
        y3=y1me1;
        fy3=subs(f,{x1,x2},{y1me1(1),y1me1(2)});
    else
        y3=y2;
        fy3=fy2;
    end
    y1pe2=y3+delta*e2;
    if subs(f,{x1,x2},{y1pe2(1),y1pe2(2)})<fy3
        y4=y1pe2;
        fy4=subs(f,{x1,x2},{y1pe2(1),y1pe2(2)});
    else
        y4=y3;
        fy4=fy3;
    end
    y1me2=y4-delta*e2;
    if subs(f,{x1,x2},{y1me2(1),y1me2(2)})<fy4
        y5=y1me2;
        fy5=subs(f,{x1,x2},{y1me2(1),y1me2(2)});
    else
        y5=y4;
        fy5=fy4;
    end
    X(i+1,:)=y5;
    y1=X(i+1,:)+alpha*(X(i+1,:)-X(i,:));
    if X(i+1,:)==X(i,:)
        delta=delta*beta;
    end
    k=k+1;
    disp(['Ì½²â´ÎÊý:',num2str(k),',x1=',num2str(X(i,1)),',x2=',num2str(X(i,2))]);
end
   