program ex;
type
  data=record   {тип запись данные о дате}
    year:word;  {год}
    month:1..12;     {месяц}
    day:1..31;       {день}
  end;
  zap=record         {тип запись о студенте}
    fam:string[16];  {фамилия}
    birthday:data;   {дата рождения}
  end;

var fb:array[1..25] of zap;    {массив данных о группе студентов}
  fff:string;   {строка для ввода фамилии}
  i,j,m,n:byte;
  key:boolean; {ключ поиска, если фамилия найдена - true}

begin
  writeln('Vvedite dannie o kolicestvo studentov n<=25');
  readln(n);
  m:=0;
  {ввод исходных данных с клавиатуры поле за полем}
  repeat
    m:=m+1;
    write('Vvedite Familiyu : ');
    readln(fb[m].fam);
    write('Vvedite god rozhdeniya : ');
    readln(fb[m].birthday.year);
    write('    Mesyats : ');
    readln(fb[m].birthday.month);
    write('    Den     : ');
    readln(fb[m].birthday.day);
  until n=m;
  writeln;
  {вывод исходных данных на экране с помощью оператора with}
  writeln('Spisok studentov gruppi ');
  writeln;
  for i:=1 to m do
    with fb[i] do
      begin
        write(i:2, fam:17);
        with birthday do
          writeln(year:6, month:4, day:4);
      end;
  writeln;
  {поиск данных в массиве записей}
  writeln('Vvedite Familiyu');
  readln(fff);
  i:=0;
  key:=false; {признак "данные не найдены"}
  repeat
    i:=i+1;
    if fb[i].fam=fff then
      key:=true
  until key or (i=m);
  {вывод результата}
  if key then       {если такой студент найден, то выводим данные}
    with fb[i] do
      begin
        writeln('Dannie o studente :');
        write(fam:18,' ');
        with birthday do
          writeln(day:2,':',month:2,':',year:5,'goda');
      end
  else
    writeln('Dannih o studente : ',fff:18,' net.');
  readln;
end.
{Разработать программу, которая вводит в массив записей информацию
о студентах учебной группы: фамилию и дату рождения.
Организовать поиск информации о студенте,
фамилия которого вводится с клавиатуры.}
