program sort1;
var a:array[1..20] of real;
  j,i,n,imin:integer;
  min:real;

begin
  writeln('Vvedite kolicestvo cisel n<=20:');
  readln(n);
  writeln('Vvedite massiv:');
  for i:=1 to n do read(a[i]);
  readln;
  for j:=1 to n-1 do          {цикл поиска минимальных элементов массива}
    begin
      min:=a[j];  {начальное значение для поиска минимума}
      imin:=j;    {начальное значение индекса минимального элемента}
      for i:=j+1 to n do {цикл поиска минимкма и его индекса}
        if a[i]<min then {если элемент меньше уже найденного
                                              минимального}
          begin
            min:=a[i];  {запоминаем элемент}
            imin:=i     {запоминаем его индекс}
          end;
      {меняем местами найденный минимум и первый элемент текущего массива}
      a[imin]:=a[j];
      a[j]:=min;
    end;
  for i:=1 to n do write(a[i]:6:2);
  writeln;
  readln;
end.
