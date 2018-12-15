program stroka1;
var st:string;
  p,spos:integer;

begin
  writeln('Vvedite stroku');
  readln(st);      {вводим строку}
  p:=0;            {обнуляем счеткик слов}
  if st[length(st)]<>'' then
    st:=st+'';   {если в конце нет пробела,
                 то добавим его}
  while length(st)<>0 do
    begin
      spos:=pos('',st);
      if spos>5 then
        p:=p+1; {определяем длину слова}
      delete(st,1,spos);
    end;
  writeln('V stroke ',p,' slov(a), dlina kotorih bolshe cetiryoh.');
  readln;
end.
{Разработать программу, которая определяет в строке количество
слов длинее четырех символов.
Слова разделены одним пробелом.}
