program ex;
uses crt;
var i,s,a:integer;

begin
  i:=1;
  s:=0;
  while i<=10 do
    begin
      read(a);
      if a>50 then
        writeln('Chislo ne dolzhno previshat 50')
      else
        begin
          s:=s+a;
          i:=i+1;
        end
    end;
  writeln(s);
  readln;
  readln;
end.
