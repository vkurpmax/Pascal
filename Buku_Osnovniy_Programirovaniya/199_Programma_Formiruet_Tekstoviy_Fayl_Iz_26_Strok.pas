program form_text_file;
var
  f:text;    {файловая переменная для текстового файла}
  a:char; n,i:integer;  fname,st:string[30];

begin
  writeln('Vvedite imya fayla');
  readln(fname);
  assign(f,fname); {инициализируем файловую переменную}
  rewrite(f);   {открываем файл для записи}
  randomize;    {инициализируем датчик случайных чисел}
  for a:='A' to 'Z' do    {формируем строки}
    begin
      st:='';
      n:=random(30)+1;
      for i:=1 to n do
        st:=st+a;
      writeln(f,st);  {записываем строку в текстовый файл}
      writeln(st);    {для контроля - выводим ее на экран}
    end;
  close(f);   {закрываем файл}
  readln;
end.
{Разработать программу, которая формирует текстовый файл из 26 строк,
содержащих случайное количество соответствующих прописных букв латинского алфавита, например:

AAAAA
BBBBB
C
DDDDDDDDDDDDDDDDDDDDDD
EEEEEEEEEEEEEE И Т.Д.}
