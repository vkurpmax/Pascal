program difgramma;
uses graph;
const
  kmax=12;  {максимальное количество значений функции}
  r=150;  {радиус диаграммы}
  n=5;  {ширина поля вывода}
  m=2;  {размер дробной части числа}
type
  mas=array[1..kmax+1] of integer;
  mas1=array[1..kmax] of real;
var
  f:mas1;  {массив значений функции}
  alfa:mas;  {массив значений углов диаграммы}
    k,  {фактическое количество значений функции}
    bet,  {величина угла, образованного радиусом и биссектрисой сектора диаграммы}
    y,x,  {координаты точки, являющейся центром дуги сектора}
    x1,y1,  {координаты начальной точки вывода надписи}
    xn,yn,  {координаты центра диаграммы}
    i:integer;
  st:string[5];  {строка для хранения выводимой надписи}
  s:real;  {сумма значений функции}
  driver,err:smallint;  {тип и режим работы адаптера}

begin
  writeln('Vvedite kolicestvo tocek (ot 1 do ',kmax:3,')');
  readln(k);
  {выводим значения функций и определяем их сумму}
  s:=0;
  for i:=1 to k do
    begin
      writeln('Vvedite',i:3,'-e znacenie funktsii');
      readln(f[i]);
      while f[i]<0 do
        begin
          writeln('Nedopustimoe znacenie, povtorite vvod');
          writeln('Vvedite',i:3,'-e znacenie funktsii');
          readln(f[i]);
        end;
      s:=s+f[i];
    end;
  if s=0 then
    begin
      writeln('Vse znaceniya nulevie.');
      readln;
      halt(1);  {выход по ошибке}
    end;
  {инициализируем графический режим}
  driver:=detect;
  InitGraph(driver,err,'');
  SetBkColor(15);  {белый цвет фона}
  SetPalette(1,0);
  SetColor(1);  {черный цвет рисования}
  {вычисляем координаты центра диаграммы}
  xn:=GetMaxX div 2;
  yn:=GetMaxY div 2;
  {рассчитываем значения углов секторов диаграммы}
  alfa[1]:=0;
  for i:=2 to k+1 do
    begin
      if i<>k+1 then
        alfa[i]:=alfa[i-1]+round(f[i-1]/s*360)
      else
        alfa[k+1]:=360;
      SetFillStyle(i mod 10,i);  {установим тип и цвет закраски сектора}
      Pieslice(xn,yn,alfa[i-1],alfa[i],r);  {изобразим сектор}
      {вычисляем начальные координаты вывода надписей}
      bet:=(alfa[i-1]+alfa[i]) div 2;
      x:=xn+round(r*cos(bet*pi/180));
      y:=yn-round(r*sin(bet*pi/180));
      if ((bet>=0) and (bet<=90)) or ((bet>=270) and (bet<=360)) then
        x1:=x+10
      else
        x1:=x-8*n-10;
      if ((bet>=0) and (bet<=180)) then
        y1:=y-15
      else
        y1:=y+7;
      Str(f[i-1]:n:m,st);  {преобразуем значение в строку}
      OutTextXY(x1,y1,st);  {выведем надпись}
    end;
  readln;
  CloseGraph;
end.
