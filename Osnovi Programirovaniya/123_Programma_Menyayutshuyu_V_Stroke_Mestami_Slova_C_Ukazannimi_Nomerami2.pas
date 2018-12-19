program Stroka3;
var ks,n1,n2,i,k:byte; s,s1:string;
  MasStr:array[1..100] of string[20];   {рабочий массив}

begin
  writeln('Vvedite ishodnuyu stroky');
  readln(s);
  ks:=0;    {обнуляем счетчик слов}
  if s[length(s)]<>'' then
    s:=s+'';  {если в конце строки нет пробела, то дописываем его}
  {разбор строки}
  while s<>'' do {пока в строке остались слова}
    begin
      ks:=ks+1;  {увеличиваем счетчик слов}
      k:=pos(' ',s);   {определяем конец слова}
      masStr[ks]:=copy(s,1,k);   {копируем слово в массив}
      delete(s,1,k);             {удаляем слово из строки}
    end;
  {обмен слов}
  writeln('Vvedite nomera slov dlya obmena');
  readln(n1,n2);   {вводим номера}
  while (n1>ks) or (n2>ks) or (n1=n2) do     {пока номера не допустимы}
    begin
      writeln('Kolicestvo slov v stroke ',ks:5,
      '.Odinakovie nomera ne dopustimi. Povtorite vvod nomerov.');
      readln(n1,n2);      {вводим номера}
    end;
  s1:=MasStr[n1];         {меняем слова местами}
  MasStr[n1]:=MasStr[n2];
  MasStr[n2]:=s1;
  {объединение слов в строку}
  for i:=1 to ks do
    s:=s+MasStr[i]; {объединяем слова в строку}
  delete(s,length(s),1);        {удаляем пробел после последнего слова}
  writeln('Rezultat: ',s);      {выводим результат}
  readln;
end.
{Разработать программу, меняющую в строке местами слова с указанными номерами.
Запретить ввод номеров, которые превышают количество слов в строке или
равны между собой.}

{Вариант 2

Вначале разобьем текст на слова и поместим каждое слово с элемент
вспомогатального массива строк.
Затем выполним перестановку элементов.
И, наконец, вновь объединим слова в строку.}
