program ex;

uses Stroka;
var s:string[26];     i:integer;

begin
  s:='A';
  for i:=2 to 26 do
    Add(s);
  writeln(s);
  readln
end.
