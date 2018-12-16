program ex;
type p=array[1..100] of integer;
var pole:p;
  k,m:integer;
{функция проверки перспективности комбинации}
Function new_r(n:integer;  pole:p):boolean;
var j:integer;
  begin
    new_r:=false;
    for j:=1 to n-1 do
      if(pole[j]=pole[n]) or (abs(pole[j]-pole[n])=n-j) then
        exit;
    new_r:=true;
  end;
{рекурсивания функция генерации комбинации}
procedure ferz(n,m:integer;  var pole:p);
var i:integer;
begin
  if n=m+1 then      {если установлено m ферзей, то вывести решение}
    begin
      for i:=1 to m do
        write(pole[i]:2);
      writeln;
    end
  else {иначе - пытаемся установить следующего ферзя}
    for i:=1 to m do     {m способами}
      begin
        pole[n]:=i;      {установка n-го ферзея}
        if new_r(n,pole) then {проверка перспективность комбинации}
          ferz(n+1,m,pole);   {рекурсивный вызов установки следующего ферзя}
      end;
end;
{основная программа}

begin
  writeln('Vvedite razmer doski:');
  readln(m);
  k:=0;
  ferz(1,m,pole);
  readln;
end.
{Задача о расстановке ферзей.
Разработать программу, которая формирует все возможные варианты расстанови m (m>3)
ферзей на шахматной доске m x m клеток, при которых ферзи не "бьют" друг друга.}

{Ограниченный перебор, реализованный с использованием рекурсии.}
