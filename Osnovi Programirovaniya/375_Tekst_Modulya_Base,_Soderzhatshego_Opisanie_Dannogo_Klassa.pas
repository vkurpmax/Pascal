unit Base;

{$mode objfpc}{$H+}

interface
Type str30=string[30];
  rec=record
    rfamily,rname,rtelefon:str30;
  end;
Type TBase=Object
  f:file of rec;
  family,name,telefon:str30;  {результаты поиска}
  p_family,p_name:str30;  {данные поиска}
  k1,k2:boolean;  {ключи поиска}
  procedure Open(fname:str30);  {открытие/создание файла}
  procedure Add(afamily,aname,atelefon:str30);  {добавление записей}
  function Find(afamily,aname:str30):boolean;  {поиск первого}
  function FindNext:boolean;  {поиск следующего}
  procedure Closef;  {закрытие файла}
end;

implementation
Procedure TBase.Open;
begin
  Assign(f,fname);  {инициализация файловой переменной}
  {$1-}
    Reset(f);
  {$1+}  {открытие с проверкой существования}
  if IOResult<>0 then
    ReWrite(f);  {создание файла}
end;
procedure TBase.Add;
var r:rec;
begin
  Seek(f,FileSize(f));  {устанавливаем файловый указатель на конец файла}
  r.rfamily:=afamily;  {создаем запись}
  r.rname:=aname;
  r.rtelefon:=atelefon;
  write(f,r);  {выводим запись в файл}
end;
function TBase.Find;
begin
  close(f);  {закрываем файл}
  ReSet(f);  {открываем файл для чтения}
  p_family:=afamily;  {сохраняем данные поиска}
  p_name:=aname;
  k1:=p_family<>'';  {устанавливаем два ключа поиска}
  k2:=p_name<>'';
  find:=findNext;  {ищем запись по ключам}
end;
function TBase.FindNext;
var r:rec;
  k3,k4,ff:boolean;  {ключи поиска и его результат}
begin
  ff:=false;  {ключ поиска "запись не найдена"}
  while not Eof(f) and no ff do
    begin
      read(f,r);
      k3:=p_family:=r.family;  {строим еще два ключа поиска}
      k4:=p_name:=r.name;
      if (k1 and k2 and k3 and k4)  {выбираем записи}
        or (not k1 and k2 and k4) or (k1 and not k2 and k3) then
          begin
            ff:=true;  {ключ поиска "запись найдена"}
            family:=r.rfamily;  {копируем результаты поиска}
            name:=r.rname;
            telefon:=r.rtelefon;
          end
      end;
  FindNext:=ff;  {возвращаем ключ поиска}
end;
procedure TBase.Closef;
begin
  close(f);  {закрываем файл}
end;
end.
