program ex;
var st:string[40];
  k:byte;

begin
  writeln('Vvedite stroku dlinoy <= 40 simvolov');
  readln(st);
  write('Vvedennaya stroka:');
  writeln(st);
  k:=pos('__',st);  {проверяем, есть ли сдвоенные пробелы?}
  while k<>0 do     {пока есть сдвоенные пробелы}
    begin
      delete(st,k,1);     {удаляем первый пробел}
      k:=pos('__',st)     {проверяем, есть ли сдвоенные пробелы?}
    end;
  if st[1]='_' then
    delete(st,1,1);       {удалили пробел в начале}
  k:=length(st);
  if st[k]='_' then
    delete(st,k,1);       {удалили пробел в конце}
  writeln('Rezultat:');
  if length(st)<>0 then
    writeln(st)
  else
    writeln('Stroka soderzhala tolko probeli.');
  readln;
end.
{Дана строка не более 40 символов, состоящая из слов, разделенных пробелами.
Разработать программу удалуния "лишних" пробелов.
Лишними считать пробелы в начале строки до первого символа,
второй и более пробелы между словами и пробелы в конце строки.}
