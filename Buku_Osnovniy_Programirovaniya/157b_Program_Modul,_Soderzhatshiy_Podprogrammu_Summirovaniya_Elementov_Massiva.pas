program ex;

uses Summa; {указание используемого модуля}
var a:mas;  {используем ресурс mas}
  i,n:integer;

begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  readln;
  writeln('Summa= ',sum(a,n)); {используем ресурс sum}
  readln;
end.
