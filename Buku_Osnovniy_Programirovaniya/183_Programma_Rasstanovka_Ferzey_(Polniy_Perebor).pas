program ex;
type p=array[1..100] of integer;
var pole:p;
  i,m:integer;
{функция проверки комбинации}
function new_r(m:integer;  pole:p):boolean;
var i,j:integer;
begin
  new_r:=false;
  for i:=1 to m-1 do
    for j:=i+1 to m do
      if (pole[i]=pole[j]) or (abs(pole[j]-pole[i])=j-i) then
        exit;
  new_r:=true;
end;
{функция генерации вариантов}
function variant(m:integer; var pole:p):boolean;
var i:integer;
begin
  pole[m]:=pole[m]+1;       {добавление единицы в младший разряд счетчика}
  for i:=m downto 2 do      {обработка переносов}
    if pole[i]>m then
      begin
        pole[i]:=1;
        pole[i-1]:=pole[i-1]+1;
      end;
  if pole[1]<=m then           {если есть еще варианты}
    variant:=true
  else
    variant:=false;
end;
{основная программа}

begin
  writeln('Vvedite razmer doski');
  readln(m);
  for i:=1 to m do
    pole[i]:=1; {исходная комбинация}
  repeat
    if New_r(m,pole) then {проверяем расстановку}
      begin
        for i:=1 to m do
          write(pole[i]:2);
        writeln;
      end;
  until not variant(m,pole);         {если есть варианты, то генерируем
                                     новый вариант}
  readln;
end.
{Задача о расстаноыке ферзей.
Разработать программу, которая формирует все возможные варианты расстановки m (m>3)
ферзей на шахматной доске m x m клеток, при которых ферзей не "бьют" друг друга.}

{полный перебор}
