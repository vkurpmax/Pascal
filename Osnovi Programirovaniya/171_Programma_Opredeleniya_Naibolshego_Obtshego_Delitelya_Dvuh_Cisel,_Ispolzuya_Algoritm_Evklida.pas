program ex;
var a,b,r:integer;
function nod(a,b:integer):integer;
begin
  if a=b then
    nod:=a   {базис}
  else       {рекурсивный вызов}
    if a>b then
      nod:=nod(a-b,b)
    else
      nod:=nod(a,b-a)
end;

begin
  readln(a,b);
  r:=nod(a,b);
  writeln(r);
  readln;
end.
