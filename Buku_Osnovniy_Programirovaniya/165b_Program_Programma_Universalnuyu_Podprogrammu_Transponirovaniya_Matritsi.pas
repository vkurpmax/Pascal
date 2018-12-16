program ex;

uses Matrica;
var a:array[1..10,1..10] of real;
  i,j:integer;

begin
  writeln('Vvedite matritsu a(5*5):');
  for i:=1 to 5 do
    begin
      for j:=1 to 5 do
        read(a[i,j]);
      readln;
    end;
  tran(a,5,10);
  writeln('Rezultat:');
  for i:=1 to 5 do
    begin
      for j:=1 to 5 do
        write(a[i,j]:6:2);
      writeln;
    end;
end.
