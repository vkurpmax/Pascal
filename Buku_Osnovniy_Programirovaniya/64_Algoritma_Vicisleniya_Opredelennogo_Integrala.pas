program ex;
var a,b,S1,S2,d,eps,x:real; n,i:longint;

begin
  writeln('Vvedite a, b i epsilon: ');
  readln(a,b,eps);
  S1:=1E+10;
  n:=5;
  repeat
    S2:=S1;
    n:=n*2;
    d:=(b-a)/n;
    x:=a;
    s1:=0;
    for i:=1 to n do
      begin
        S1:=S1+x*x-1;
        x:=x+d;
      end;
    S1:=S1*d;
  until abs(S1-S2)<eps;
  writeln('I= ',S1:10:6);
end.
