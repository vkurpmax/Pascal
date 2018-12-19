program ex;
type mas=array[1..10] of integer;  {тип "массив из 10 целых чисел}
var A:mas;
  i,n:integer;
function sum(B:mas; n:integer):integer;
  var s:integer;    i:integer;
    begin
      s:=0;
      for i:=1 to n do
        s:=s+B[i];
      sum:=s;
    end;

begin
  readln(n);
  for i:=1 to n do
    read(A[i]);
  readln;
  writeln('Summa= ',sum(A,n));
  readln;
end.
{Разработать подпрограмму суммирования элементов массива размерности n, n<=10}
