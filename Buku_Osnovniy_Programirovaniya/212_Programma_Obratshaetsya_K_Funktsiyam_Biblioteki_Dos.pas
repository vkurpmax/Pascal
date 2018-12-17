program fundos;  {проверка функций библиотеки dos}
uses dos,crt;
var fi,fo:text;  {текстовые файлы}
  k,i:word;      time,size:longint;           date:DateTime;
  pathf:DirStr;  namef:NameStr;               extf:ExtStr;
  atr:byte;  {переменные для хранения байта атрибутов файла}
  name:string;

begin
  clrscr;
  writeln('Vvedite imya fayla:');
  readln(name);
  assign(fi,name);
  {$1-} Reset(fi);{$1+}  {проверяем наличие файла с именем name}
  if IOResult<>0 then
    begin
      writeln(#7,'net fayla s imenem ',name);
      Halt;
    end;
  GetFTime(fi,time);  {определяем дату создания файла}
  UnPackTime(time,date);  {распаковываем дату}
  writeln('Data sozdaniya fayla=',date.year:5,date.month:3,date.day:3);
  writeln('Vremya sozdaniya fayla=',date.hour:3,date.min:3,date.sec:3);
  with date do
    begin
      year:=2001;
      month:=3;
      day:=8
    end;
  PackTime(date,time);  {упаковываем дату}
  SetFTime(fi,time);  {меняем дату}
  writeln('Posle izmeneniya dati:');
  writeln('data sozdaniya fayla=',date.year:5,date.month:3,date.day:3);
  writeln('Vremya sozdaniya fayla=',date.hour:3,date.min:3,date.sec:3);
  FSplit(name,pathf,namef,extf);  {расщепляем имя файла}
  writeln('Polnoe imya fayla=',pathf:25,namef:12,extf:8);
  GetFAttr(fi,k);  {определяем атрибуты файла}
  atr:=lo(k);
  writeln('bayt atributov ',atr);
  size:=DiskFree(1);
  writeln('Svobodnoe mesto na diske A ',size:10,' bayt');
  close(fi);
  readln;
end.
