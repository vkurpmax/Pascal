program Stroka;
var n:byte; s,s1,s2:string;

begin
  writeln('Vvedite ishodnuyu stroky');
  readln(s);
  writeln('Vvedite zamenyaemor slovo:');
  readln(s1);
  writeln('Vvedite zamenyayutshee slovo:');
  readln(s2);
  n:=pos(s1,s);    {определяем вхождение заменяемого сочетания}
  while n>0 do
    begin
      delete(s,n,length(s1));  {удаляем заменяемое сочетание}
      insert(s2,s,n);          {вставляем заменяющее сочетание}
      n:=pos(s1,s);  {определяем следующее вхождение}
    end;
  writeln('Rezultat: ',s);
  readln;
end.
{Разработать программу, меняющую в строке одно сочетание букв на другое.}
