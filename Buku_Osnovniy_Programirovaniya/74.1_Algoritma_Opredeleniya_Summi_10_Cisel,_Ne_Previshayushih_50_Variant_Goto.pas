program ex;
var i,s,a:integer;
label cycl;
begin
  i:=1;
  s:=0;
  while i<=10 do
    begin
      read(a);
      if a>50 then
        begin
          writeln('Chislo ne dolzhno previshat 50');
          goto cycl;      {передача управления на конец цикла}
        end;
      s:=s+a;  {операторы, которые необходимо обойти}
      i:=i+1;
      cycl:
    end;
  writeln(s);
  readln;
  readln;
end.
