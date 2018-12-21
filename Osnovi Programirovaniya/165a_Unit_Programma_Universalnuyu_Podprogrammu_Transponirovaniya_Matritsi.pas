unit Matrica;

{$mode objfpc}{$H+}

interface
  Procedure tran(Var x;  n,P:integer);


implementation
  Procedure tran(Var x;  n,P:integer);
  var a:array[1..2*maxint div sizeof(real)] of real absolute x;
    i,j:integer;
    t:real;

  begin
    for i:=2 to n do
      for j:=1 to i-1 do
        begin
          t:=a[(i-1)*P+j];
          a[(i-1)*P+j]:=a[(j-1)*P+i];
          a[(j-1)*P*i]:=t;
        end;
  end;

end.
