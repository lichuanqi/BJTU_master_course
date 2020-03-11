positive Variables x1,x2;
free variable fx;
Equations
         obj1
         obj2
         obj3
         obj4
         obj5
         cost;
cost..fx=e=-sqr(x1)+6*x1-sqr(x2)+8*x2;
obj1..x1 =l= 4;
obj2..2*x2 =l= 12;
obj3..3*x1+2*x2 =l= 18;
obj4..x1 =g= 0;
obj5..x2 =g= 0;

Model solution /all/
solve solution using nlp maximizing fx;



