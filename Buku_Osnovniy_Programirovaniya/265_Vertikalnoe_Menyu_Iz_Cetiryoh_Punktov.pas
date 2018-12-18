program ex;
uses crt;
var npos,i:integer;
  ch1,ch2:char;
type
  win=record  {описываем тип окон пунктов меню}
    x1,y1,x2,y2:word;  {координаты окна}
    text:string[8];  {название пункта меню}
  end;
{описываем массив окон пунктов меню}
const menu:array[1..4] of win =
                       ((x1:5; y1:4; x2:15; y2:4; text:'new'),
                       (x1:5; y1:5; x2:15; y2:5; text:'open'),
                       (x1:5; y1:6; x2:15; y2:6; text:'save'),
                       (x1:5; y1:7; x2:15; y2:7; text:'exit'));
{процедура рисования пункта меню}
Procedure DrawWin(w:win; attr:byte);
begin
  with w do
    begin
      TextAttr:=attr;  {устанавливаем атрибут окна пункта}
      window(x1,y1,x2,y2);  {устанавливаем окно пункта}
      clrscr;  {высвечиваем окно пункта}
      GotoXY(2,1);  {устанавливаем курсор}
      write(text);  {выводим название пункта}
    end;
end;
{процедура рисования меню с выделенным пунктов npos}
procedure DrawMenu(npos:integer);
begin
  clrscr;
  for i:=1 to 4 do
    if i=npos then
      DrawWin(menu[i],94)  {выводим выделенный пункт}
    else
      DrawWin(menu[i],30);  {выводим невыделенный пункт}
end;
{основная программа}
begin
  npos:=1;  {выделенный пункт меню}
  DrawMenu(npos);  {выводим меню}
  repeat
    ch1:=readkey;
    if ch1=#0 then
      ch2:=readkey;
    case ch1 of
    #0: case ch2 of
        #72: begin  {стрелка вверх}
               if npos>1 then  {если не верхний пункт}
                 begin
                   DrawWin(menu[npos],30);  {убираем выделение текущего пункта меню}
                   npos:=npos-1;  {переходим к предыдущему пункту}
                   DrawWin(menu[npos],94);  {выделяем новый пункт}
                 end;
             end;
        #80: begin
               if npos<4 then  {если не нижний пункт}
                 begin
                   DrawWin(menu[npos],30);  {убираем выделение текущего пункта}
                   npos:=npos+1;  {переходим к следующему пункту}
                   DrawWin(menu[npos],94);  {выделяем новый пункт}
                 end;
             end;
        end;  {case интерпретации расширенного кода}
    #13: begin
           window(1,1,80,25);
           TextAttr:=7;
           clrscr;  {очищаем экран}
           case npos of
           1: begin
                write('Vipolnen punkt ',menu[npos].text);
                readln;
              end;
           2: begin
                write('Vipolnen punkt ',menu[npos].text);
                readln;
              end;
           3: begin
                write('Vipolnen punkt ',menu[npos].text);
                readln;
              end;
           end;  {case}
           DrawMenu(npos);  {выводим меню}
         end;
    end;  {case}
  until (ch1=#27) or ((ch1=#13) and (npos=4));
  window(1,1,80,26);
  TextAttr:=7;
  clrscr;  {очищаем экран}
end.
