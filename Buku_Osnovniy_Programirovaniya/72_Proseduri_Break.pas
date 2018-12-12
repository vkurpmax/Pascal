program ex;
var i,n:integer; x,y,a,b,h:real;

begin
  write('Vvedite a,b,h:');
  readln(a,b,h);
  n:=round((b-a)/h+1.5);  {определяем количество элементов}
  x:=a;
  for i:=1 to n do
  begin
    y:=sin(x);
    if y<0 then
    begin
      writeln('y= ',y:8:6,'pri x= ',x:6:3);
      break;      {осуществляем досрочный выход из цикла}
    end;
    x:=x+h;
  end;
  {место, куда будет передано управление при выполнении break}
  if y>=0 then writeln('Element ne naidyon.');
end.
