$ontext
    demo for lp_1
    created by junhua chen
    cjh@bjtu.edu.cn
$offtext

set i/1,2/;
set j/1,2/;

parameter c(j)/
1        -3
2        -2
/;

parameter a(i,j)/
1.1      1
1.2      1
2.1      2
2.2      1
/;

parameter b(i)/
1        40
2        60
/;



positive variable x(j);
variable z;

equation cost_funciton;
equation constraint(i);

cost_funciton..
         z=e=sum(j,c(j)*x(j));
constraint(i)..
         sum(j,a(i,j)*x(j))=l=b(i);


model lp1/cost_funciton,constraint/;
solve lp1 using LP minimazing z;


display x.l;
