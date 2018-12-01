program for_down_to_statement;
uses crt;
var
  i,n:integer;

begin
  writeln('Enter Your Number: ');
  readln(n);
  for i:=n downto 1 do
  writeln('i = ',i);
  readln;
end.
