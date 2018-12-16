program ex;

uses Summa4;
var a:array[1..10] of integer;
  b:array[1..15] of real;
  i,n:integer;

begin
  for i:=1 to 10 do
    read(a[i]);
  readln;
  writeln('Summa= ',sum(a,10,tinteger):8:1);
  for i:=1 to 15 do
    read(b[i]);
  readln;
  writeln('Summa= ',sum(b,15,treal):8:1);
end.
