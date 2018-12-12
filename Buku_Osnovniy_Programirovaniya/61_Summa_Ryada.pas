program ex;
var S,R,X,eps:real;

begin
  writeln('Vvedite x i epsilon: ');
  readln(X,eps);
  if abs(x)>1 then {если x>1, то ищем сумму ряда}
  begin
    s:=1;
    R:=1;
    while abs(R)>eps do
      begin
        R:=-R/X;
        S:=S+R;
      end;
    writeln('Pri x= ',x:6:2,'S= ',S:8:2,', a R= ',R:8:6);
  end
  else writeln('Ryad rashoditcya');
  readln;
end.
