program Stroka2;
var ns1,ns2,ks,n1,n2,dl1,dl2,ns,dls,i,w:byte;
  s,s1,s2:string;

begin
  writeln('Vvedite Ishodnuyu Stroku');
  readln(s);
  ks:=0;    {обнуляем счетник слов}
  for i:=1 to length(s) do
    if (s[i]='') or (i=length(s)) then  {если конец очередного слова}
      ks:=ks+1;  {увеличиваем счетник слов}
  writeln('Vvedite nomera clov dlya obmena');
  readln(n1,n2);  {вводим номера}
  while (n1>ks) or (n2>ks) or (n1=n2) do  {пока номера не допустимы}
    begin
      writeln('Kolicestvo clov v stroke ',ks:5,
                          '.Odinakovie nomera ne dopustimi. Povtorite vvod nomerov.');
      readln(n1,n2);  {вводим номера}
    end;
  if n1>n2 then   {сортируем номера по возрастанию}
    begin
      w:=n1;
      n1:=n2;
      n2:=w;
    end;
  ns:=1;    {начало первого слова равно 1}
  dls:=0;   {длина первого слова равна 0}
  ks:=0;    {номер слова пока равен 0}
  for i:=0 to length(s) do    {по всей строке}
    begin
      if(s[i]='') or (i=length(s)) then  {если слово завершено}
        begin
          if (i=length(s)) and (s[i]<>'') then   {если в конце строки
                                                 нет пробела}
            dls:=dls+1;   {корректируем длину слова}
          ks:=ks+1;
          if ks=n1 then   {если это первое слово}
            begin  {то запоминаем начало и длину}
              ns1:=ns;
              dl1:=dls;
            end;
          if ks=n2 then   {если это второе слово}
            begin  {то запоминаем начало и длину}
              ns2:=ns;
              dl2:=dls;
            end;
          dls:=0;     {обнуляем длину текущего слова}
          ns:=i+1;    {запоминаем начало текущего слова}
        end
      else
        dls:=dls+1;   {считаем длину очередного слова}
    end;
  s1:=copy(s,ns1,dl1);  {копируем значение первого слова}
  s2:=copy(s,ns2,dl2);  {копируем значение второго слова}
  delete(s,ns2,dl2);    {удаляем дальнее слово}
  insert(s1,s,ns2);     {вместо него вставляем ближнее}
  delete(s,ns1,dl1);    {удаляем ближнее слово}
  insert(s2,s,ns1);     {вставляем дальнее}
  writeln('Rezultat: ',s);
  readln;
end.
{разработать программу, меняющую в строке местами слова с указанными номерами.
Запретить ввод номеров, которые превышают количество слов в строке или равны между собой}
