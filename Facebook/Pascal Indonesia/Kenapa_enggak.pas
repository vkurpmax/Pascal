program Project1;

uses
types;
var
a: TSmallIntDynArray;
c,i: integer;
begin
  a := TSmallIntDynArray.Create(107,-6,9,-13,15,-15,-65,78,-7,0,-6,10,-44);
  c := 0;
  for i in a do begin
    Inc(c,i);
    write(Chr(c));
  end;
  WriteLn;
  readln;
end.
