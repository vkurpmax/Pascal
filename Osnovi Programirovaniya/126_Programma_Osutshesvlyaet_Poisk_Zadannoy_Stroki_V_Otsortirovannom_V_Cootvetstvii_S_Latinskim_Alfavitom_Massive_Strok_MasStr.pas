program ex;
var MasStr:array[1..100] of string[22];
  n,k,l:integer; st:string[22];   key:boolean;

begin
  n:=1;
  writeln('Vvedite do 100 strok. Zavershenie vvodda - pustaya stroka');
  readln(MasStr[n]);
  while(MasStr[n]<>'') and (n<100) do
    begin
      n:=n+1;
      readln(MasStr[n]);
    end;
  if n<100 then
    n:=n-1;    {слов в массиве на одно меньше}
  writeln('Vvedite stroku dlya poiska.');
  readln(st);
  k:=1;
  key:=false;
  while(n-k>=0) and not key do {пока диапазон положителен и запись не найдена}
    begin
      l:=(n-k) div 2+k; {определяем среднее значение индекса}
      if st=MasStr[l] then
        key:=true     {запись найдена}
      else
        if st>MasStr[l] then
          k:=l+1  {смещаем левую границу}
        else
          n:=l-1; {смещаем правую границу}
    end;
  if key then
    writeln('Stroka naydena. Nomer raven ',l)
  else
    writeln('Stroka ne naydena.');
  readln;
end.
{Разработать программу, которая осуществляет поиск заданной строкм в отсортированном
в соответствии с латинским алфавитом массиве строк MasStr[n], n<100.
Конкретное количество строк массива определять в процессе их ввода.}
