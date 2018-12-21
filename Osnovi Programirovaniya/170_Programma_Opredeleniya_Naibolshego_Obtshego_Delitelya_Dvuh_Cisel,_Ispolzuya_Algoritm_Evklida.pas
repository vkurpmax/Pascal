program ex;
var a,b,r:integer;
procedure nod(a,b:integer; var r:integer);
begin
  if a=b then
    r:=a {базис}
  else
    if a>b then
      nod(a-b,b,r)
    else
      nod(a,b-a,r)
end;

begin
  readln(a,b);
  nod(a,b,r);
  writeln(r);
  readln;
end.
