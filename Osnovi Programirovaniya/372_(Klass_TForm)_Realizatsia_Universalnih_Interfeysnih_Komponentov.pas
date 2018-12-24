unit Form;

{$mode objfpc}{$H+}

interface

uses
  crt,Win,Input,Menu;
Type TForm=Object(TMenu)
  ninput:integer;  {количество полей ввода}
  masinp:array[1..5] of TInput;  {массив полей ввода}
  constructor Init(ax1,ay1,ax2,ay2,aattr,axt,ayt:integer; atext:str80;
    n:integer; const w1:array of TWin; k:integer;
    const w2:array of TInput);
  procedure Draw; virtual;  {вывод окна}
  procedure Clear;  {очистка окон ввода}
  procedure Input;  {ввод информации из окон ввода}
end;

implementation
constructor TForm.Init;
var i:integer;
begin
  inherited Init(ax1,ay1,ax2,ay2,aattr,axt,ayt,atext,n,w1);
  ninput:=k;  {количество задействованных окон ввода}
  for i:=1 to ninput do
  masinp[i].Init(w2[i-1].x1, w2[i-1].y1,
                 w2[i-1].x2, w2[i-1].y2, w2[i-1].attr,
                 w2[i-1].xt, w2[i].yt, w2[i-1].text,
                 w2[i-1].inp.x1, w2[i-1].inp.y1,
                 w2[i-1].inp.x2, w2[i-1].inp.y2,
                 w2[i-1].inp.attr, w2[i-1].inp.xt, w2[i-1].inp.yt,
                 w2[i-1].inp.text);
end;
procedure TForm.Draw;
var i:integer;
begin
  inherited Draw;  {выводим основное окно}
  for i:=1 to nalt do
    masalt[i].Draw;  {выводим окна пунктов}
  for i:=1 to ninput do masinp[i].Draw;  {выводим окна ввода}
end;
procedure TForm.Clear;
var i:integer;
begin
  for i:=1 to ninput do
    masinp[i].Clearl  {чистим окна ввода}
end;
procedure TForm.Input;
var i:integer;
begin
  clear;
  for i:=1 to ninput do
    masinp[i].Input;  {вводим данные}
end;
end.
