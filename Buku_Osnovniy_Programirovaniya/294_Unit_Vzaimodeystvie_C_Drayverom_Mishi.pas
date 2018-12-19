unit Mouse;

{$mode objfpc}{$H+}

interface

  uses Dos;
  Function ResetMouse:Boolean;  {проверить наличие}
  Procedure ShowMouseCursor;  {показать курсор мыши}
  Procedure HideMouseCursor;  {спрятать курсор мыши}
  {прочитать состояние мыши}
  Procedure ReadMouseState(var x,y:integer;  {координаты мыши}
    var LeftButton,  {нажата левая клавиша}
        MiddleButton,  {нажата средняя клавиша}
        RightButton:boolean);  {нажата правая клавиша}
  procedure MoveMouseCursor(x,y:integer);  {установить курсор мыши
                                           в точку с заданными координатами}

implementation
{проверить наличие}
Function ReSetMouse:boolean;
var r:registers;
begin
  r.AX:=0;
  intr($33,r);
  ReSetMouse:=r.AX=$FFFF;
end;
{показать курсор мыши}
procedure ShowMouseCursor;
var r:registers;
begin
  r.AX:=2;
  intr($33,r);
end;
{прочитать состояние мыши}
procedure ReadMouseState(var x,y:integer;  {координаты мыши}
  var LeftButton,  {нажата левая клавиша}
  MiddleButton,  {нажата средняя клавиша}
  RightButton:boolean;  {нажата правая клавиша}
  var r:registers;
begin
  r.AX:=3;
  intr($33,3);
  x:=r.CX;
  y:=r.DX;
  LeftButton:=(r.BX AND 1)<>0;
  RightButton:=(r.BX AND 2)<>0;
  MiddleButton:=(r.BX AND 4)<>0;
end;
  {установить курсор мыши}
  procedure MoveMouseCursor(x,y:integer);
  var r:registers;
  begin
    r.AX:=4;
    r.CX:=x;
    r.DX:=y;
    intr($33,r);
  end;
end.
