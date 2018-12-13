program ex;
var a:array[1..5] of real;
  amax:real;
  i, imax:byte;

begin
  {запрос на ввод массива}
  writeln('Vvedite 5 cisel:');
  {ввод элементов массива}
  for i:=1 to 5 do read(a[i]);
  readln;
  {поиск максимального элемента}
  amax:=a[1];
  imax:=1;
  for i:=2 to 5 do
    if a[i]>amax then
      begin
        amax:=a[i];
        imax:=i;
      end;
  {вывод массива}
  writeln('Ishodnie dannie:');
  for i:=1 to 5 do write(a[i]:8:2);
  writeln;
  {вывод результата}
  writeln('Maksimalniy element raven ',amax:5:2,', igo nomer raven ',imax);
  readln;
end.
