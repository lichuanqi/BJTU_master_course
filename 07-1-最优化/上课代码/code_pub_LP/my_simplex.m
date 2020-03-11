
%function[A, subs, x, z] = my_simplex(A, b,c,v)
function[ X0,z,A] = my_simplex()
% The simplex algorithm for the LP problem

%                    min(max) z = c*x
%                 Subject to: Ax <= b

%                              x >= 0
clc;
A=[1,1,1,0;
   2,1,0,1];
b=[40;
   60];
c=[-3,-2,0,0];
v=[3,4,1,2];

[m, n] = size(A);

B=A(:,v(1:m)); 
X0=inv(B)*b;
X0=[X0;zeros(n-m,1)];
 
stop_or_not=0;
 while stop_or_not==0

    m_B=A(:,v(1:m));
    m_N=A(:,v(m+1:n));
    m_0=zeros(n-m,m);
    m_I=eye(n-m,n-m);

%     M=[m_B,m_N;m_0,m_I];
    d=[-inv(m_B)*m_N];
    d=[d;m_I];

    c_B=c(:,v(1:m));
    c_N=c(:,v(m+1:n));
    c_BN=[c_B,c_N];
    
    rhs=c_BN*d;
    
    if all(rhs>=0)
        disp(sprintf('\n      x is an optimial solution'));        
        stop_or_not=1;
    else
        [r,q]=min(rhs);
        if all(d(:,q)>0)
            disp(sprintf('\n      Problem has unbounded objective function'));
            z = -inf;
            return;
        end
               
        landa=999;out=0;
        for i=1:m
           if d(i,q)<0 & landa>(-X0(i,1)/d(i,q))
               landa=-X0(i,1)/d(i,q);out=i; 
           end
        end 
        X1=X0+landa*d(:,q);

        q=m+q;
        in_Bv=v(1,q);
        out_Bv=v(1,out);    
        v(1,out)=in_Bv;
        v(1,q)=out_Bv;

        t=X1(q,1);
        X1(q,1)=X1(out,1); 
        X1(out,1)=t;
        X0=X1;
        %%%%%%%%print
        v
        X0
        z=c_BN*X0
        
       disp(sprintf(' Press any key to continue ...\n'))
       pause
       

    end
 end  %end while
    
   
    
end





