program ex;
var i,n:integer; x,y,a,b,h:real;
Label konec;     {объявляем метку}

begin
  write('Vvedite a,b,h:');
  readln(a,b,h);
  n:=round((b-a)/h+1.5);   {определяем количество элементов}
  x:=a;
  for i:=1 to n do
  begin
    y:=sin(x);
    if y<0 then
    begin
      writeln('y= ',y:8:6,'pri x= ',x:6:3);
      goto konec; {управление передаем на конец программы
      после вывода сообщения о том, что элемент на найден}
    end;
    x:=x+h;
  end;
  writeln('Element ne naidyon. ');
  konec:           {место, куда передается управление}
end.
