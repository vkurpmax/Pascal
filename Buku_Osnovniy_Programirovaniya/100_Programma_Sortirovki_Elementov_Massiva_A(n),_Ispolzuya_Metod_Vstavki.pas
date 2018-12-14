program sort2;
var a:array[0..20] of real; B:real;
  i,j,n:integer;

begin
  writeln('Vvedite kolicestvo cisel n<=20.');
  readln(n);
  writeln('Vvedite massiv.');
  for i:=1 to n do read(a[i]);
  readln;
  for i:=2 to n do {начиная со второго элемента до конца массива}
    begin
      B:=a[i];  {запоминаем i-й элемент}
      a[0]:=B;  {этот же элемент записываем в a[0] - этот барьер}
      j:=i-1;   {индекс i запоминаем в j}
      while B<a[j] do  {пока очередной рассматриваемый элемент
                   больше i-го элемента}
        begin
          a[j+1]:=a[j];   {сдвигаем элемент}
          j:=j-1;         {уменьшаем j на 1}
        end;
      a[j+1]:=B;   {как только найдено место, туда записывается B}
    end;
  writeln('Otcortirovanniy massiv:');
  for i:=1 to n do write(a[i]:6:2);
  writeln;
  readln;
end.
