program ex;
var a:array[1..10] of integer; kol,i,j,n:integer;

begin
  writeln('Vvedite kolicestvo elementov massiva <=10');
  readln(n);       {вводим количество элементов}
  writeln('Vvedite ',n,' elementov massiva');
  for i:=1 to n do read(a[i]);     {вводим массив}
  writeln('Vvedenniy massiv');
  for i:=1 to n do write(a[i]:3); writeln; {выводим исходный массив}
  kol:=0;  {обнуляем количество отрицательных элементов}
  for i:=1 to n div 2 do
    if a[2*i]<0 then    {если элемент отрицателен, то}
      kol:=kol+1;       {увеличиваем количество на 1}
  if kol=0 then
    writeln('Otritsatelnih elementov na cyotnih mestah net')
  else
    writeln('Kolicestvo otritsatelnih elementov kol=', kol:3);
  readln;
  readln;
end.

{программа определяющую количество отрицательных элементов среди элементов,
стоящих в массиве на местаъ с четными номерами.}
