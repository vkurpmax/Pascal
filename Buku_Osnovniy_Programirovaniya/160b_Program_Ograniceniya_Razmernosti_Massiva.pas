program ex;
uses Summa2;
var a:array[1..10] of integer;
  i,n:integer;

begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  readln;
  writeln('Summa= ',sum(a,n));
  readln;
end.
