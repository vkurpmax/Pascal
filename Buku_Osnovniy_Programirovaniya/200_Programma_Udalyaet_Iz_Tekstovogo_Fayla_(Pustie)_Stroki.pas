program ex;
var f1,f2:text; {файловые переменные текстовых файлов}
  st,name:string;

begin
  writeln('Vvedite imya fayla:');
  readln(name);
  assign(f1,name); {инициализируем файловую переменную}
  {$1-}    {проверяем существование файла}
  reset(f1);
  {$1+}
  if IOResult=0 then  {если файл с заданным именем существует}
    begin
      assign(f2,'temp.dat');  {инициализируем новый файл}
      rewrite(f2);     {открываем новый файл для записи}
      while not EOF(f1) do   {пока не достигнут конец файла}
        begin
          if SeekEOLn(f1) then
            readln(f1,st) {если строка пустая, то пропускаем ее}
          else
            begin
              readln(f1,st);    {читаем строку}
              writeln(f2,st);   {записываем ее в новый файл}
            end;
        end;
      close(f1);    {закрываем старый файл}
      close(f2);    {закрываем новый файл}
      erase(f1);    {удаляем старый файл}
      ReName(f2,name);    {переименовываем новый файл}
    end
  else
    writeln('Fayl s takim imenem ne naydyon.');
end.
