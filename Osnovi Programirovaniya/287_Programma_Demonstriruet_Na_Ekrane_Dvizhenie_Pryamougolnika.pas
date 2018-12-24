program ex;
uses crt,graph;
const
  r=100;
type
  mas=array[1..4] of integer;
var
  x,y,x1,y1:mas;
  xn,yn,xc,yc,i,j,k1:integer;
  t,k:real;
  gd,gm:smallint;
{изображение квадрата по координатам его вершин}
procedure Square(x,y:mas);
  begin
    Line(x[1],y[1],x[2],y[2]);
    Line(x[2],y[2],x[3],y[3]);
    Line(x[3],y[3],x[4],y[4]);
    Line(x[4],y[4],x[1],y[1]);
  end;
{определение координат повернутой точки}
procedure Pow(xc,yc,x,y:integer;  t:real;  var x1,y1:integer);
  begin
    x1:=xc+round((x-xc)*cos(t))+round((y-yc)*sin(t));
    y1:=yc+round((y-yc)*cos(t))-round((x-xc)*sin(t));
  end;
{определение координат точки после масштабирования}
procedure Massch(xc,yc,x,y:integer; k:real; var x1,y1:integer);
  begin
    x1:=round(x*k+(1-k)*xc);
    y1:=round(y*k+(1-k)*yc);
  end;
{основная программа}

begin
  gd:=detect;
  InitGraph(gd,gm,'d:/bp/bgi');
  SetColor(2);
  xn:=GetMaxX div 4;
  yn:=GetMaxY div 3*2;
  xc:=GetMaxX-xn;
  yc:=GetMaxY-yn;
  {расчет начальных координат вершин квадрата}
  x[1]:=xn-r;  y[1]:=yn-r;
  x[2]:=xn+r;  y[2]:=yn-r;
  x[3]:=xn+r;  y[3]:=yn+r;
  x[4]:=xn-r;  y[4]:=yn+r;
  k:=0.99;
  t:=0;
  {покадровый вывод на экран}
  while (t<1) and not KeyPressed do
    begin
      SetColor(2);  {установим цвет рисования}
      Square(x,y);  {нарисуем квадрат}
      t:=t+0.001;  {увеличим угол поворота}
      {масщтабирование}
      for j:=1 to 4 do  {определим координаты вершин}
        Massch(xc,yc,x[j],y[j],k,x1[j],y1[j]);
      Massch(xc,yc,xn,yn,k,xn,yn);  {определим координаты центра}
      {поворот}
      for j:=1 to 4 do  {определим координаты вершин}
        Pow(xn,yn,x1[j],y1[j],-t,x1[j],y1[j]);
      for j:=1 to 1500 do
        Delay(1000);  {или NewDelay см. параграф 8.3}
      SetColor(0);  {установим цвет рисования - цвет фона}
      square(x,y);  {стираем квадрат}
      x:=x1;  {заменим координаты вершин на новые}
      y:=y1;
    end;
  closegraph;
end.
