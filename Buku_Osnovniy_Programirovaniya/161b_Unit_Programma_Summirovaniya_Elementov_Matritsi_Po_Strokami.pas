program ex;

uses Summa3;
const a:array[-5..-3,3..7] of integer=((1,1,1,1,1),(2,2,2,2,2),(3,3,3,3,3));
var i:integer;

begin
  for i:=low(a) to high(a) do
    writeln(sum(a[i]));
  readln;
end.
