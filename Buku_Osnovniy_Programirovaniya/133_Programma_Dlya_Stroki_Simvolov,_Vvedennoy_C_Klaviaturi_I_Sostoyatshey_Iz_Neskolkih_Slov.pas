program ex;
type setchar=set of char;
const G:setchar=['a','i','u','e','o'];  {типизированная константа
                 "множество гласных букв"}
var res1, {множество гласных, входящих в каждое слово}
  res2,   {множество гласных, входящих только в одно слово}
  res3,   {множество гласных в предложении}
  res4,   {множество гласных, входящих более чем в одно слово}
  mnsl:setchar;    {множество гласных текущего слова}
  st,slovo:string;       ch:char;
  i,k:integer;           first:boolean;

begin
  writeln('Vvedite ishodnuyu stroku:');
  readln(st);      {читаем исходную строку}
  st:=st+'';     {добавляем в конец пробел для простоты обработки}
  first:=true;   {признак "первое слово"}
  while st<>'' do   {цикл выделения и обработки слов}
    begin
      k:=pos('',st);
      slovo:=copy(st,1,k-1);   {выделяем слово}
      delete(st,1,k);          {удаляем слово из строки}
      {определяем множество гласных, входящих в данное слово}
      mnsl:=[];   {исходное состояние "пустое множество"}
      for i:=1 to k-1 do
        if slovo[i] in G then         {если гласная буква, то}
          mnsl:=mnsl+[slovo[i]];       {добавляем к множеству}
      {формируем множества результатов}
      if first then   {если первое слово, то}
        begin
          res1:=mnsl;  {входят в каждое слово}
          res2:=mnsl;  {входят не более чем в одно слово}
          res3:=mnsl;  {встретившиеся гласные}
          res4:=[];    {входят более чес в одно слово}
          first:=false {выключаем признак "первое слово"}
        end
      else {если не первое слово предложения, то}
        begin
          res1:=res1*mnsl; {входят в каждое слово}
          res4:=res4+res3*mnsl;    {входят более чем в одно слово}
          res3:=res3+mnsl; {встретившиеся гласные}
        end
    end;
  res2:=res3-res4;  {входящие в одно слово}
  {выводим результаты анализа предложения}
  writeln('Glasnie, kotorie vhodyat v kazhdoe slovo:');
  for ch:=#0 to #255 do
    if ch in res1 then
      write(ch:2);
  writeln;
  writeln('Glasnie, vhodyatshie tolko v odno slovo:');
  for ch:=#0 to #255 do
    if ch in res2 then
      write(ch:2);
  writeln;
  writeln('Glasnie, vhodyatshie hotya bi v odno slovo:');
  for ch:=#0 to #255 do
    if ch in res3 then
      write(ch:2);
  writeln;
  writeln('Glasnie, vhodyatshir bolee cem v odno slovo:');
  for ch:=#0 to #255 do
    if ch in res4 then
      write(ch:2);
  writeln;
  readln;
end.
{Разработать программу, которая для строки символовЮ введенной с клавиатуры
и состоящей из нескольких слов, разделенных пробелами, определяет множество
гласных, которые:
- встречаются в каждом слове строки;
- встречаются только в одном слове строки;
- встречаются хотя бы в одном слове строки;
- встречаются более чем в одном слове строки.}
