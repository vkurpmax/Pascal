program copir;
const recs=1024;  {размер записи}
var fi,fo:file;  {нетипизированные файлы}
    buf:array[1..2*recs] of byte;  {буфер на 2048 байт}
    i:word;
    namein,nameout:string;

begin
  writeln('Vvedite imya fayla - Istochnika:');
  readln(namein);
  {проверка наличия файла с указанным именем}
  assign(fi,namein);
  {$1-}
  Reset(fi,1);  {открываем файл для чтения}
  {$1+}
  if IOResult<>0 then
    begin
      writeln(#7,'Ne sutshestvuet fayla c imenem ',namein);
      Halt
    end;
  writeln('Vvedite imya fayla - priemnika ');
  readln(nameout);
  assign(fo,nameout);
  rewrite(fo,1);  {открываем файл для записи}
  while not EOF(fi) do
    begin
      blockread(fi,buf,sizeof(buf),i);  {читаем блок из входного файла}
      blockwrite(fo,buf,i);  {пишем блок из буфера в выходной файл}
    end;
  close(fi);
  close(fo)
end.
