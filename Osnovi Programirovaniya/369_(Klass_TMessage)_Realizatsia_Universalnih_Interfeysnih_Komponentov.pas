unit Message;

{$mode objfpc}{$H+}

interface

uses
  crt,Win;
Type TMessage=Object(TWin)
  ok:TWin;  {окно подтверждения}
  procedure Init(ax1,ay1,ax2,ay2,aattr,axt,ayt:integer; atext:str80;
                 bx1,by1,bx2,by2,battr,bxt,byt:integer; btext:str80);
  procedure Run;  {ожидание подтверждения}
  procedure Draw;  {вывести окно}
end;

implementation
  Procedure TMessage.Init;
  begin
    inherited Init(ax1,ay1,ax2,ay2,aattr,axt,ayt,atext);
    ok.Init(bx1,by1,bx2,by2,battr,bxt,byt,btext);
  end;
  procedure TMessage.Draw;
  begin
    inherited Draw;  {выводим родительское окно}
    ok.Draw;  {выводим окно запроса на продолжение работы}
  end;
  procedure TMessage.Run;
  begin
    Draw;  {выводим окно}
    ReadKey;  {ожидаем подтверждения}
  end;
end.
