program Memory;
uses crt,Win,Input,Message,Menu,Form,Base;
{объявление классов - потомков библиотечных классов}
Type TMain=Object(TMenu)  {главное меню}
  may:boolean;  {признак открытия файла}
  procedure Enter; virtual;
end;
Type TIName=object(TInput)  {ввод имени файла}
  function Error:boolean; virtual;  {проверка имени файла}
end;
Type TAdd=object(TForm)  {форма для добавления записей}
  procedure Enter; virtual;  {завершение ввода одной записи}
end;
Type TFind=Object(TForm)  {форме для поиска телефонов}
  procedure Input; virtual;  {ввод данных поиска}
  procedure Enter; virtual;  {поиск одной записи}
  procedure Show;  {вывод результата поиска в окна}
end;
{объявление объектов-переменнвх}
var M:TMain;  {объект Главное меню}
    N:TIName;  {объект Ввод имени файла}
    A:TAdd;  {объект Добавление записей}
    F:TFind;  {объект Поиск записей}
    ND:TMessage;  {объект Сообщение об отсутствии данных}
    B:TBase;  {объект файл}
{описание дополнительных методов}
procedure TMain.Enter;  {обработка выбора пунктов главного меню}
begin
  case npos of
    1:begin
        N.Draw;  {выводим окно ввода}
        N.Input;  {вводим имя файла, проверяя его допустимость}
        B.Open(N.inp.text);  {если файл существует, то открываем, иначе - создаем}
        may:=true;  {устанавливаем признак открытия файла}
      end;
    2:if may then  {если определен файл данных}
        A.Run;  {осуществляем добавление записей}
    3:if may then  {если определен файл данных}
        F.Run;  {осуществляем поиск записей}
  end;
end;
Function TIName.Error;  {проверка имени файла}
var l:integer;
begin
  l:=pos('.',inp.Text);
  if l=0 then
      l:=length(inp.Text);
  if(l>0) and (l<=8) then
      Error:=false
  else
    Error:=true;
end;
procedure TAdd.Enter;  {обработка пунктов меню добавления}
begin
  case npos of
    1:begin
        Input;  {вводим фамилию, имя и телефон}
        B.Add(masinp[1].inp.text, masinp[2].inp.text,
              masinp[3].inp.text);  {записываем в файл}
      end;
  end;  {case}
end;
procedure TFind.Enter;  {обработка пунтов меню поиска}
begin
  case npos of
    1:begin
        Input;  {вводим фамилию и имя}
        if B.Find(masinp[1].inp.text, masinp[2].inp.text) then
          Show
        else
          ND.Run;  {выводим сообщение об отсутствии данных}
      end;
    2:begin
        if B.FindNext then
          Show
        else
          ND.Run;  {выводим сообщение об отсутствии данных}
      end;
  end;
end;
procedure TFind.Input;  {ввод данных для поиска информации}
begin
  clear;  {очищаем поля ввода}
  masinp[1].Input;  {вводим фамилию}
  masinp[2].Input;  {вводим имя}
end;
procedure TFind.Show;  {вывод найденной информации в окно}
begin
  clear;
  masinp[1].inp.text:=B.family;
  masinp[1].Draw;  {выводим фамилию}
  masinp[2].inp.text:=B.name;
  masinp[2].Draw;  {выводим имя}
  masinp[3].inp.text:=B.telefon;
  masinp[3].Draw;  {выводим телефон}
end;
{описание констант для инициализации полей-массивов}
const menu1:array[1..4] of TWin=
    ((x1:10; y1:14; x2:23; y2:18; attr:113; xt:3; yt:2;
             text:'Sozdat / Otkrit Knizhky'),
    (x1:26; y1:14; x2:39; y2:18; attr:113; xt:4; yt:2;
             text:'Zapisat telefon'),
    (x1:42; y1:14; x2:55; y2:18; attr:113; xt:5; yt:2;
             text:'Nayti telefon'),
    (x1:58; y1:14; x2:71; y2:18; attr:113; xt:4; yt:2;
             text:'Zavershit rabotu'));
  menu2:array[1..2] of TWin=
    ((x1:28; y1:18; x2:38; y2:21; attr:113; xt:2; yt:2; text:'Dobavit'),
     (x1:42; y1:18; x2:52; y2:21; attr:113; xt;2; yt;2; text:'Vihod'));
  menu3:array[1..3] of TWin=
    ((x1:23; y1:18; x2:33; y2:21; attr:113; xt:2; yt:2; text:'Nayti'),
     (x1:35; y1:18; x2:45; y2:21; attr:113; xt:2; yt:2; text:'Sleduyutshiy'),
     (x1:47; y1:18; x2:57; y2:21; attr:113; xt;2; yt:2; text:'Vihod'));
  inpp:array[1..3] of TInput=
    ((x1:22; y1:8; x2:32; y2:8; attr:94; xt:1; yt:1; text:'Familiya';
             Inp:(x1:34; y1:8; x2:54; y2:8; attr:112; xt:1; yt:1; text:'')),
     (x1:22; y1:10; x2:32; y2:10; attr:94; xt:1; yt:1; text:'Imya';
             Inp:(x1:34; y1:10; x2:54; y2:10; attr: 112; xt:1; yt:1; text:'')),
     (x1,22; y1:12; x2:32; y2:12; attr:94; xt:1; yt:1; text:'Telefon';
             Inp:(x1:34; y1:12; x2:54; y2:12; attr:112; xt:1; yt:1; text:'')));
{основная программа}
begin
  {инициализируем объекты}
  M.Init(5,5,76,20,30,5,3,'Zapisnaya knizhka',4,menu1);
  A.Init(20,2,60,22,94,5,3,'Dobavlenie zapisey',2,menu2,3,inpp);
  N.Init(30,8,50,19,94,3,3,'Vvedite imya fayla:',35,12,45,12,112,1,1,'');
  F.Init(20,2,60,22,94,5,3,'Poisk zapisey',3,menu3,3,inpp);
  ND.Init(30,6,50,14,30,6,2,'Net dannih',34,11,46,12,71,2,1,'Prodolzhit');
  {начинаем работу}
  M.may:=false;  {устанавливаем признак "файл не открыт"}
  M.Run;  {передаем управление Главному меню}
  if may then B.Closef;  {закрываем файл}
  {очищаем экран}
  TextBackGround(0);
  TextColor(1);
  Window(1,1,80,25);
  clrscr;
end;

begin
end.
