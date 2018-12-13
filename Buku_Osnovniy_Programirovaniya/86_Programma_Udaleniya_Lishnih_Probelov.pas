program Stroka;
var i,j,n:byte; key:boolean;
  s:array[1..4] of char;    {дополнительный символ - для точки}

begin
  writeln('Vvedite ishodnuyu stroku dlinoy do 40 simvolov:');
  i:=1;
  read(s[i]);
  while (i<40) and (s[i]<>'.') do
    begin
      i:=i+1;
      read(s[i]);
    end;
  readln;
  if s[i]='.' then n:=i-1 else n:=i;       {определяем количество введенных
                                           символо без точки}
  write('Vvedennaya stroki:'); writeln(s);
  j:=0; {номер символа в строке результата}
  key:=false;  {гасим признак "первый пробел"}
  for i:=1 to n do
    if s[i]='' then   {если обнаружен пробел}
      begin
        key:=false;   {дальше пойдут лишние пробелы}
        j:=j+1;       {пробел переписываем в результат}
        s[j]:=s[i];
      end
  else {символ}
    begin
      key:=true;   {устанавливаем признак "первый пробел"}
      j:=j+1;
      s[j]:=s[i];  {символ переписываем в результат}
    end;
  if key then j:=j+1;       {если пробела в конце нет, то увеличиваем
                           длину для записи точки}
  s[j]:='.';               {записываем точку}
  writeln('Preobrazovannaya Stroka ');
  for i:=1 to j do write(s[j]); writeln;
  readln;
end.

{дана строка не более 40 символов, состоящая из слов,
разделенных пробелами, и заверщающаяся точкой.

Разработать программу удаления "лишних" пробелов.

Лишними считать пробелы в начале строки,
второй и более между словами и пробелы в конце строки.}
