program project1;
uses crt;
var i,s,a:integer;

begin
  i:=1;
  s:=0;
  while i<=10 do
    begin
      read(a);
      if a>50 then
        begin
          writeln('Chislo ne dolzhno previshat 50');
          Continue;       {передаем управление на следующую итерацию}
        end;
      s:=s+a;
      i:=i+1;
    end;
  writeln(s);
end.
