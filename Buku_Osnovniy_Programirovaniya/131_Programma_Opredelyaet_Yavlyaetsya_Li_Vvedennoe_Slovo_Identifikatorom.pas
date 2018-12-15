program ex;
var st:string;
  key:boolean;
  i:integer;

begin
  writeln('Vvedite stroku');
  readln(st);
  if st[1] in ['A'..'Z','a'..'z','_'] then  {проверка первого символа}
    begin
      i:=2;
      key:=true;
      while(i<=length(st)) and key do {проверка остальных символов}
        if st[i] in ['A'..'Z','a'..'z','_','0'..'9'] then
          inc(i)
        else key:=false;
      if key then
        writeln('Stroka ',st,'- identifikator.')
      else
        writeln('Stroka ',st,' soderzhit nedopustimir simvoli.');
      end
  else
    writeln('Stroka ',st,'nacinaetsya s nedopustimogo simvola.');
  readln;
end.
{Разработать программу, которая определяет, является ли введенное слово идентификатором,
т.е. начинается ли оно с буквы или знака подчеркивания и не содержит ли специальных символов.}
