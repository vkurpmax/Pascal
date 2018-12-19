program ex;
var a:array[1..100] of integer;
  i,j,n:integer;

begin
  writeln('Vvedite kolicestvo elementov n <= 100');
  readln(n);
  writeln('Vvedite ',n,' elementov massiva');
  for i:=1 to n do read(a[i]);
  readln;
  writeln(' Ishodniy massiv ');
  for i:=1 to n do write(a[i]:5); writeln;
  i:=1;    {начальное значение индекса массива}
  while (a[i]>=0) and (i<n) do i:=i+1; {пока элемент не отрицателен
                  и индекс меньше n - переходим к следующему элементу}
  if i<=n then
    writeln('Perviy otritsatelniy element ',a[i]:5,' imeet indeks ',i:4)
  else writeln('Takih elementov v massive net.');
  readln;
end.
