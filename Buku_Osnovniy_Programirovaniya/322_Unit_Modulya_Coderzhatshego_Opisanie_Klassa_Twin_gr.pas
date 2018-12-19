unit WinGr;

{$mode objfpc}{$H+}

interface

uses
  Crt,Graph;
Type
  Fn=Function(X:real):real;
  arr=array[1..200] of pinttype;
  TWin_gr=object
    public
      procedure Init(axn,axk:real; an:integer; aF:Fn;
        ax1,ay1,ax2,ay2:integer);  {инициализация объектов}
      porcedure Run;  {вывод графика}
    private
      x1,y1,x2,y2:integer;  {координаты окна}
      F:Fn;  {адрес функции}
      n:integer;  {количество точек}
      xn,xk,  {интервал изменения аргумента}
        dx,Fmin,Fmax,  {шаг аргумента и экстремумы функции}
        mx,my:real;  {масштабы по осям}
      xm,ym,  {размеры окна}
        xs,ys:integer;  {координаты нижней границы графика}
      s:string[10];  {рабочая строка для вывода разметки}
      procedure Fminmax;  {определение минимума и максимума}
      procedure Rx;  {сетка, параллельная оси OX}
      procedure Ry;  {сетка, параллельная оси OY}
  end;

implementation
{метод инициализиции полей}
procedure TWin_gr.Init;
begin
  {параметры функции}
  xn:=axn;
  xk:=axk;
  n:=an;
  F:=aF;
  {координаты окна}
  x1:=ax1;
  y1:=ay1;
  x2:=ax2;
  y2:=ay2;
  {размер окна}
  xm:=x2-x1+1;
  ym:=y2-y1+1;
  dx:=(xk-xn)/n;  {устанавливаем шаг графика функции}
  Fminmax;  {определяем минимальное и максимальное значения
                        функции на заданном отрезке}
  {определяем нижнюю левую точку графика}
  xs:=60;
  ys:=ym-xs;
  {определяем масштабы по x и y}
  mx:=(xm-xs*2)/abs(xk-xn);
  my:=(ym-xs*2)/abs(Fmax-Fmin);
  end;
{метод определения экструмумов функции на отрезке}
procedure TWin_gr.Fminmax;
var x,y:real;
    i:integer;
begin
  x:=xn;
  y:=F(x);
  Fmin:=y;
  Fmax:=y;
  for i:2 to n do
    begin
      x:=x+dx;
      y:=F(x);
      if y>Fmax then
        Fmax:=y;
      if y<Fmin then
        Fmin:=y;
      end;
  end;
{метод построения окна с графиком и координатной сеткой}
procedure Twin_gr.Run;
var x:real;
    i:integer;
    din_arr:^arr;  {указатель на динамический массив координат точек}
begin
  SetViewPort(x1,y1,x2,y2,true);  {устанавливаем окно}
  ClearViewPort;  {очищаем окно}
  SetColor(2);  {устанавливаем цвет рисования}
  Rectangle(0,0,x2-x1,y2-y1);  {рисуем рамку}
  SetColor(14);  {устанавливаем цвет рисования}
  SetLineStyle(0,0,3);  {устанавливаем стиль линии: толщина 3}
  x:=xn;
  GetMem(din_arr,2*n);  {запрашиваем память под массив координат}
  for i:=1 to n do
    begin
      din_arr^[i].x:=round((x-xn)*mx+xs);
      din_arr^[i].y:=round((Fmin-f(x))*my+ys);
      x:=x+dx;
    end;
  DrawPoly(n,din_arr^);  {рисуем график}
  FreeMem(din_arr,2*n);  {освобождаем память}
  SetLineStyle(0,0,1);  {устанавливаем стиль линии: толщина 1}
  Rx;  {выводим сетку, параллельную оси x}
  Ry;  {выводим сетку, параллельную оси y}
  Readkey;  {ожидаем ввода любого символа}
end;
{метод вывода сетки, параллельной оси x}
procedure Twin_gr.Rx;
var x,dxl:real;
begin
  x:=xn;
  dxl:(xk-xn)/5;
  SetColor(11);
  SetTextStyle(0,1,1);
  repeat
    Str(x:6:3,s);
    OutTextXY(round((x-xn)*mx+xs-3),ys+5,s);
    Line(round((x-xn)*mx+xs),ym-20,round((x-xn)*mx+xs),20);
    x:=x+dxl;
  until x>xk+0.0000001;
end;
{метод вывода сетки, параллельной оси x}
procedure Twin_gr.Ry;
var y,dyl:real;
begin
  y:=Fmin;
  SetTextStyle(0,0,1);
  dyl:=(fmax-fmin)/5;
  repeat
    Str(y:6:3,s);
    OutTextXY(5,round(-(y-Fmin)*my+ys-10),s);
    Line(10,round(-(y-Fmin)*my+ys),
         xm-10,round(-(y-Fmin)*my+ys));
    y:=y+dyl;
  until y>Fmax+0.0000001;
end;
end.
