program char_text_file;
type ff=file of char;  {новый тип - символьный файл}
var
  f:ff;      {файловая переменная типа файл символов}
  a:char;
  n,i:integer;
  fname,st:string[30];

begin
  writeln('Vvedite imya fayla');
  readln(fname);
  assign(f,fname); {открываем файловую переменную с файлом}
  reset(f);  {открыть текстовый файл как типизированный на чтение}
  while not EOF(f) do {пока не достигнут конец файла}
    begin
      st:='';
      read(f,a);   {читаем символ}
      while(a<>#13) and not EOF(f) do   {до маркера конца строки
                                        или конца файла}
        begin
          st:=st+a;   {добавляем считанный символ в строку}
          read(f,a);  {читаем очередной символ}
        end;
      if not EOF(f) then
        read(f,a);  {пропускаем символ #10}
      writeln(st);  {выводим сформированную строку}
    end;
  close(f);
end.
