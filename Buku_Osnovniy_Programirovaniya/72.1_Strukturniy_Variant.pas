program ex;
var x,y,a,b,h:real;

begin
  write('Vvedite a,b,h:');
  readln(a,b,h);
  x:=a-h;
  repeat
    x:=x+h;
    y:=sin(x);
  until (x+h>b) or (y<0);       {комбинированное условие выхода из цикла}
  if y<0 then writeln('y= ',y:8:6,' pri x= ',x:6:3)
  else writeln('Element ne naidyon.');
end.
