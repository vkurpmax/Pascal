program ex;
uses crt;
var c1,c2:char;

begin
  repeat
    c1:=ReadKey;  {вводим код}
    if c1=#0 then  {если расширенный код}
      begin
        c2:=ReadKey;  {то читаем расширенный scan-код}
        writeln(ord(c1):5, ord(c2):5)  {выводим расширенный код}
      end
    else
      writeln(ord(c1):5)  {выводим код ASCII}
  until c1=#27;  {до нажатия Esc}
end.
{Разработать программу определения кодов клавиш и их
комбинаций. Выход из цикла осуществлять по нажатию клавиши Esc.}
