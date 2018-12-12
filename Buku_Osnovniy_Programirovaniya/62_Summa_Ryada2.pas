program ex;
var S,R,X,eps:real;

begin
  writeln('Vvedite znaceniye x i epsilon: ');
  readln(X,eps);
  if x>1 then
    begin
      S:=0;
      R:=1;
      repeat
        S:=S+R;
        R:=-R/X
      until abs(R*x)<=eps;
      writeln('Pri x= ',x:6:2,' S= ',S:8:2,', a R= ',R:8:6);
    end
  else writeln('Ryad rashoditsya');
  readln;
end.
