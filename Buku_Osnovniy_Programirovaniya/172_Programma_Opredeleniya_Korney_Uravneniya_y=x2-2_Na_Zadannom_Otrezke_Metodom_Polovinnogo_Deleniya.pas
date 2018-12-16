program root(a,b,eps:real;  var r:real);
var f,x:real;
begin
  x:=(a+b)/2;
  f:=x*x-1;
  if abs(f)<=eps then
    r:=x
  else
    if (a*a-1)*f>0 then
      root(x,b,eps,r)
    else
      root(a,x,eps,r)
end;

begin
  readln(a,b,eps);
  root(a,b,eps,x);
  writeln('Koren x=',x:9:7);
  readln;
end.
