unit SFun;

{$mode objfpc}{$H+}

interface
  Type func=function(x:real):real;
  procedure TabFun(f:func; a,b:real;  n:integer;
                           var Masf:array of real);


implementation
  Procedure TabFun(f:func; a,b:real;  n:integer;
                           var Masf:array of real);
  var h:real;  i:integer;
  begin
    h:=(b-a)/(n-1);
    for i:=0 to n-1 do
      Masf[i]:=f(a+h*i);
    end;

end.
