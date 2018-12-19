unit Summa2;

{$mode objfpc}{$H+}

interface
  Function sum(b:array of integer; n:integer):integer;


implementation
  var s:integer;  i:integer;
    Function sum(b:array of integer; n:integer):integer;
    begin
      s:=0;
      {при вычислении суммы учитываем,
      что индексы изменяются от 0 до n-1,
      всего n элементов}
      for i:=0 to n-1 do
      s:=s+b[i];
      sum:=s;
    end;

end.
