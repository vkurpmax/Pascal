unit Input;

{$mode objfpc}{$H+}

interface

uses
  crt,Win;
Type TInput=Object(TWin)
  inp:TWin;  {окно ввода}
  constructor Init(ax1,ay1,ax2,ay2,aattr,ayt:integer; atext:str80;
    bx1,by1,bx2,by2,battr,bxt,byt:integer; btext:str80);
  procedure Draw;  {выводи окна}
  procedure Clear;  {очистка поля ввода}
  procedure Input;  {ввод строки из окна}
  function Error:boolean; virtual;  {проверка введенных данных}
end;

implementation
  Constructor TInput.Init;
  begin
    inherited Init(ax1,ay1,ax2,ay2,aattr,axt,ayt,atext);
    Inp.Init(bx1,by1,bx2,by2,battr,bxt,byt,'');
  end;
procedure TInput.Draw;
begin
  inherited Draw;
  inp.Draw;
end;
procedure TInput.Clear;
begin
  inp.text:='';
  inp.Draw;
end;
procedure TInput.Input;
begin
  window(inp.x1,inp.y1,inp.x2,inp.y2);
  TextBackGround(inp.attr div 16);
  TextColor(inp.attr mod 16);
  repeat
    Gotoxy(inp.xt,inp.yt);
    Clear;
    Readln(inp.Text);
    Gotoxy(inp.xt,inp.yt);
    write(inp.text);
  until not Error;
end;
Function TInput.Error;  {проверка не выполняется}
begin
  Error:=false;
end;
end.
