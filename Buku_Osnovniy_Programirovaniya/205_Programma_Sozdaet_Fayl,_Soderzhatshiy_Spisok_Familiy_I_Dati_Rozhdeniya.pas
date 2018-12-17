program ex;
  type fam=record {тип запись "сведения о сотрудниках"}
             ff:string[20];   {фамилия}
             year:word;      {год рождения}
             month:1..12;    {месяц рождения}
             day:1..31       {день рождения}
           end;
  var f:file of fam;   {файловая переменная "файл сотрудников"}
    fb:fam;
    n,i:integer;
    fff:string;
    key:boolean;

begin
  assign(f,'a.dat');   {связываем файловую переменную с файлом}
  rewrite(f);          {открываем файл для записи}
  writeln('Vvedite dannie ili CTRL-Z');
  while not EOF do {цикл, пока не введено СTRL-Z}
    begin
      readln(fb.ff,fb.year,fb.month,fb.day); {вводим данные по полям,
                     фамилию вводим в отдельной строку, так как ввод
                     строки завершается нажатием клавиши Enter}
      write(f,fb);   {заносим запись в файл как один компонент}
    end;
  close(f);   {закрываем файл}
  writeln('Vvedite Familiyu');
  readln(fff);
  key:=false; {устанавливаем признак "запись не найдена"}
  ReSet(f);   {открываем файл для чтения}
  while (not EOF(f) and (not key)) do {пока не обнаружен конец файла и не найдена запись}
    begin
      read(f,fb);   {читаем запись из файла}
      if fb.ff=fff then    {если фамилии совпадают, то}
        begin {выводим данные}
          writeln('Data: ',fb.year,fb.month:3,fb.day:3);
          key:=true;     {устанавливаем признак "запись найдена"}
        end;
    end;
  if not key then
    writeln('Net dannih');    {то выводим "нет данных}
  close(f);     {закрываем файл}
  readln;
end.
