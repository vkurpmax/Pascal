{Модуль должен размещаться в файле Summa.pas}
unit Summa;


interface {объявление внешних ресурсов}
  Type mas=array[1..10] of integer;
  Function sum(b:mas; n:integer):integer;



implementation
  Function sum(b:mas; n:integer):integer;     {описание функции}
    var s:integer; i:integer;
    begin
      s:=0;
      for i:=1 to n do
        s:=s+b[i];
      sum:=s;
    end;
end.
