program example; {заголовок программы}
{раздел описаний}
var a,b:integer; {объявление переменных}
{раздел операторов}
begin
  write('Vvedite dva naturalnikh chisla:'); {запрашиваем ввод данных}
  readln(a,b);   {вводим значения}
  while a<>b do  {цикл-пока a ≠ b}
    if a>b then a:=a-b      {если a>b, тогда a:=a-b}
      else b:=b-a;          {иначе b:=b-a}
  writeln('Naibolshiy obtshiy delitel raven ',a); {выводим результат}
  readln;
end.
