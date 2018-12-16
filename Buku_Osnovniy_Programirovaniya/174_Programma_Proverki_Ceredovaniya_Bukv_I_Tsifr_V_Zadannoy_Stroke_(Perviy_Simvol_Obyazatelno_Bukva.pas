program ex;
var s:string;
function f_char(var st:string;  i:word):boolean; forward;
function f_value(var st:string; i:word):boolean;
  begin
    if i>length(st) then
      f_value:=true
    else
      if (st[i] in ['0'..'9']) then
        f_value:=f_char(st,i+1)
      else
        f_value:=false;
  end;

function f_char(var st:string;  i:word):boolean;
  begin
    if i>length(st) then
      f_char:=true
    else
      if (st[i] in ['A'..'Z','a'..'z']) then
        f_char:=f_value(st,i+1)
      else
        f_char:=false;
  end;

begin
  writeln('Vvedite stroku:');
  readln(s);
  if f_char(s,1) then
    writeln('Stroka korrektna')
  else
    writeln('Stroka ne korrektna');
  readln;
end.
