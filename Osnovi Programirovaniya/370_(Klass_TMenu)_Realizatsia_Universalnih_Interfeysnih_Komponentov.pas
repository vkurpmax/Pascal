unit Menu;

{$mode objfpc}{$H+}

interface

uses
  Crt,Win;
Type TMenu=object(TWin)
  nalt:integer;  {количество альтернатив в меню}
  masalt:array[1..10] of TWin; {массив альтернатив меню}
  npos:integer;  {номер выбранной альтернативы}
  constructor Init(ax1,ay1,ax2,ay2,aattr,
    axt,ayt:integer;  atext:str80; n:integer;
    const w:array of TWin);  {открытый массив TWin}
  procedure Run;  {реализация работы с меню}
  procedure Draw; virtual;  {вывести окно}
  procedure Enter; virtual;  {при нажатии на Enter ...}
end;

implementation
  Constructor TMenu.Init;
    var i:integer;
    begin
      inherited Init(ax1,ay1,ax2,ay2,aattr,axt,ayt,atext);
      nalt:=n;  {количество реально используемых пунтов меню}
      for i:=1 to nalt do
        masalt[i].Init(q[i-1].x1,w[i-1].y1,w[i-1].x2, w[i-1].y2,
          w[i-1].attr, w[i-1].xt, w[i-1].yt, w[i-1].text);
    end;
Procedure TMenu.Draw;
var i:integer;
begin  {очищаем экран}
  TextBackGround(0);
  TextColor(1);
  Window(1,1,80,25);
  clrscr;
  inherited Draw;  {выводим основное окно}
  for i:=1 to nalt do
    masalt[i].Draw;  {выводим окна пунктов}
end;
Procedure TMenu.Run;
var ch1,ch2:char;
  temp:integer;
begin
  Draw;
  npos:=nalt;
  masalt[npos].Setattr(71);
  repeat
    ch1:=readkey;  {читаем код клавиши}
    if ch1=#0 then
      ch2:=Readkey;
    case ch1 of
    #0: case ch2 of
        #75: begin  {перемещение курсора влево}
               temp:=npos-1;
               if temp=0 then
                 temp:=nalt;  {закольцовываем}
               masalt[npos].SetAttr(113);  {убираем выделение}
               masalt[temp].Setattr(71);  {выделяем пункт}
               npos:=temp;
             end;
        #77: begin  {перемещение курсора вправо}
               temp:=npos+1;
               if temp=nalt+1 then
                 temp:=1;  {закольцовываем}
               masalt[npos].Setattr(113);  {убираем выделение}
               masalt[temp].Setattr(71);  {выделяем пункт}
               npos:=temp;
             end;
        end
  until ((npos=nalt) and (ch1=#13)) or (ch1=#27);  {до завершения работы}
end;
Procedure TMenu.Enter;  {абстрактный метод выполнения пунктов}
begin
end;
end.
