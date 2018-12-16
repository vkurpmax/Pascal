program ex;

uses SFun;
var masF1:array[1..10] of real;  masF2:array[1..20] of real;
  i:integer;
function F1(x:real):real; far;
  begin
    F1:=sin(x);
  end;
function F2(x:real):real; far;
  begin
    F2:=exp(x)+cos(x);
  end;

begin
  writeln('Tablitsa Znaceniy Funktsii sin x:');
  TabFun(F1,0,2,10,masF1);
  for i:=1 to do
    write(masF1[i]:7:1);
  writeln;
  writeln('Tablitsa znaceniy funktsii exp x+cos x:');
  TabFun(F2,0,2,20,masF2);
  for i:=1 to 20 do
    write(masF2[i]:7:1);
  writeln;
  readln;
end.
