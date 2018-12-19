program ex;
var A,B,C,D,E:real;     {глобальные переменные}
{описание функции}
Function Stf(const X,Y,Z:real):real;
  var p:real;        {локальная переменная}

  begin              {раздел операторов функции}
    p:=(X+Y+Z)/2;
    stf:=sqrt(p*(p-X)*(p-Y)*(p-Z));
  end;
{раздел операторов основной программы}
begin
  writeln('Vvedite dlini storon i diagonali');
  readln(A,B,C,D,E);
  writeln('Plotshad cetiryohugolnika',stf(A,B,E)+stf(C,D,E):7:3);
  readln;
end.
{разработать программу, которая определяет площадь четырехугольника
по заданным длинам сторон и диагонали.}
