program ex;
var A,B,C,D,E:real;
  S1,S2:real;    {глобальные переменные}
{описание процедуры}
Procedure Stp(const X,Y,Z:real; var S:real);
  var p:real;       {локальная переменная}
  begin
    p:=(X+Y+Z)/2;
    S:=sqrt(p*(p-X)*(p-Y)*(p-Z));
  end;
{раздел операторов основной программы}

begin
  writeln('Vvedite dlini storon i diagonali');
  readln(A,B,C,D,E);
  stp(A,B,E,S1);    {вызов процедуры}
  stp(C,D,E,S2);    {вызов процедуры}
  writeln('Plotshad cetiryohugolnika ',s1+s2:7:3);
  readln
end.
{Разработать программу, которая определяет площадей четырехугольника
по заданным длинам сторон и диагонали}

{с использованием процедуры}
