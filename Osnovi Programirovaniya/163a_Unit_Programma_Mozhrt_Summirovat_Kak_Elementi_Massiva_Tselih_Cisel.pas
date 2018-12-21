unit Summa4;

{$mode objfpc}{$H+}

interface
  Type ttype=(treal,tinteger);  {описание типа третьего параметра}
  function sum(var x;  n:integer;  t:ttype):real;


implementation
  Function sum(var x;  n:integer;  t:ttype):real;
  var mr:array[1..maxint*2 div sizeof(real)] of real absolute x;
    mi:array[1..maxint*2 div sizeof(integer)] of integer absolute x;
    s:real;  i:integer;
  begin
    s:=0;
    if t=treal then
      for i:=1 to n do
        s:=s+mr[i]
    else
      for i:=1 to n do
        s:=s+mi[i];
    sum:=s;
  end;
end.
