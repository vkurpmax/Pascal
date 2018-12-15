program stroka;
var st,strez,strab:string[40];
  c1,c2,c3,n,old,code:word;

begin
  writeln('Vvedite stroku. Zaversheniye - vvod pustoy stroki.');
  readln(st);
  while st<>''do {цикл ввода, преобразования и вывода строк}
    begin
      c1:=pos(' ',st);       {определим местоположение первого пробела}
      strez:=copy(st,1,c1+1)+'.';       {перепишем фамилию, инициал
                                        и добавим точку}
      strab:=copy(st,c1+2,length(st)-c1-1);       {копируем остаток строки
                                                  в рабочее поле}
      c2:=pos(' ',strab);   {определяем местоположение второго пробела}
      strez:=strez+strab[c2+1]+'.';     {добавляем к результату второй
                                        инициал и точку}
      delete(strab,1,c2+1); {удаляем распознанную часть}
      c3:=pos(' ',strab);   {определяем местоположение третьего пробела}
      delete(strab,n,code); {удаляем остаток имени}
      val(strab,n,code);    {преобразуем год рождения в число}
      old:=2001-n;          {определяем возраст}
      str(old,strab);       {преобразуем возрасть в строку}
      strez:=strez+' '+strab;   {добавляем возраст в результат}
      writeln(strez);      {выводим результат}
      writeln('Vvedite stroku. Zaversheniye- vvod pustoy stroki.');
      readln(st);
    end;
end.
{Разработать программу, которая вводит строки, содержащие фамилию, имя,
отчество и год рождения, а выводит - строки, содержащие фамилию,
инициалы и возраст на текущий год. например:
Иванов Иван Иванович 1956 = Иванов И.И. 45}
