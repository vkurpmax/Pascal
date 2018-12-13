program ex;
var a:array[1..40] of integer; s,kol,i,n:integer;

begin
  writeln('Vvedite kolicestvo elementov massiva <=40');
  readln(n);       {вводим количество элементов массива}
  writeln('Vvedite ',n,' elementov massiva:');
  for i:=1 to n do read(a[i]);
  readln;  {вводим массив}
  writeln(' Ishodniy massiv');
  for i:=1 to n do   {выводим массив по 10 элементов в строки}
    if (i mod 10)=0 then writeln(a[i]:5)
    else write(a[i]:5);
  writeln;
  kol:=0; {обнуляем количество элементов, кратных 3}
  s:=0;   {обнуляем начальное значение суммы элементов}
  for i:=1 to n do
    if (a[i] mod 3)=0 then    {если элемент кратен 3}
      begin
        kol:=kol+1;   {увеличиваем количество на 1}
        s:=s+a[i];    {добавляем элемент к сумме}
      end;
    if kol=0 then
      writeln('Elementov, udovletvoryayutshih usloviyu, net')
    else writeln('Srednee arifmeticeskoe',kol:3,
                          ' elementov, kratnih 3 = ',(s/kol):7:2);
end.
