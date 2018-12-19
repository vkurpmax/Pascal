program Gr;
uses crt,Graph;
const
  n=5;  {количество позиций на число}
  m=2;  {размер мантиссы при выводе значений}
  k=100;  {количество точек просчета}
  nx=5; ny=5;  {количество линий сетки по x и y}
  kxn=60;  kxk=600;
  kyn=45; kyk=350;  {параметры окна}
type arr=array[1..100] of real;
  ari=array[1..100] of integer;
var
  i:integer;  {тип и режим адаптера}
  gd,gm:smallint;
  x,y:arr;  {массивы для значений функции и аргумента}
  kx,ky:ari;  {массивы для координат точек по x и y}
  ymin,ymax:real;  {экстремальные значения y}
  dx,dy:real;  {шаг сетки по x и y на графике}
  dkx,dky:integer;  {шаг сетки по x и y на экране}
  mx,my:real;  {масштабные коэффициенты}
  st:string[5];  {рабочая строка}
  h,xn,xk:real;  {шаг, интервал по оси x}

begin
  clrscr;
  write('Vvedite nacalo i konets intervala:');
  readln(xn,xk);
  h:=(xk-xn)/(k-1);  {определяем шаг по оси x}
  x[1]:=xn;
  ymin:=1e30;
  ymax:=-1e30;
  for i:=1 to k do  {таблируем функцию и ишем экстремумы}
    begin
      y[i]:=cos(x[i]+2)/2;
      if y[i]>ymax then
        ymax:=y[i];
      if y[i]<ymin then
        ymin:=y[i];
      if i<>100 then
        x[i+1]:=x[i]+h;
    end;
  mx:=(kxk-kxn)/(x[k]-x[1]);  {определяем масштаб по оси x}
  my:=(kyk-kyn)/(ymax-ymin);  {определяем масщтаб по оси y}
  for i:=1 to k do  {определяем координаты точек}
    begin
      kx[i]:=round((x[i]-x[1])*mx)+kxn;
      ky[i]:=round((ymax-y[i])*my)+kyn;
    end;
  gd:=detect;
  InitGraph(gd,gm,'');  {инициализирукм графический режим}
  SetColor(4);  {текущий цвет - красный}
  OutTextXY(180,20,'Y=cos(x+2)/2');  {выводим заголовок}
  SetColor(17);  {цвет рисования - голубой}
  SetBKColor(7);  {на сером фоне}
  Rectangle(kxn,kyn,kxk,kyk);  {рисуем прямоугольник для вывода графика}
  SetColor(4);  {текущий цвет - красный}
  for i:=1 to k-1 do  {выводим график}
    line(kx[i],ky[i],kx[i+1],ky[i+1]);
  dkx:=round((kxk-kxn)/nx);  {определяем шаг сетки по x}
  dky:=round((kyk-kyn)/ny);  {определяем шаг сетки по y}
  SetColor(17);  {текущий цвет - светло-синий}
  for i:=1 to nx do  {рисуем сетку, параллельную оси x}
    Line(kxn+dkx*i,kyn,kxn+dkx*i,kyk);
  for i:=1 to ny do  {рисуем сетку, параллельную оси y}
    Line(kxn,kyk-dky*i,kxk,kyk-dky*i);
  dx:=(x[k]-x[1])/nx;  {определяем шаг для сетки по x}
  dy:=(ymax-ymin)/ny;  {определяем шаг для сетки по y}
  SetTextJustify(1,2);  {выравнивание "по центру снизу"}
  for i:=1 to nx+1 do  {выводим значения аргумента}
    begin
      str((x[1]+dx*(i-1)):n:m,st);  {преобразуем число в строку}
      OutTextXY(kxn+dkx*(i-1),kyk+6,st);  {выводим значений под линией сетки}
    end;
  SetTextJustify(2,1);  {выравнивание "слева по центру"}
  for i:=1 to ny+1 do  {выводим значения функции}
    begin
      str((ymin+dy*(i-1)):n:m,st);  {преобразуем число в строку}
      OutTextXY(kxn-6,kyk-dky*(i-1),st);  {вывод слева от оси y}
    end;
  Readln;  {ожидаем нажатия ENTER}
  Closegraph;
end.
