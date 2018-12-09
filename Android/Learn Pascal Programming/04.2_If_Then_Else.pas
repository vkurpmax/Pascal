program Project1;
var score:integer; ans:string;

begin
  score:=0;
  writeln('Who has discovered the land of America?');
  readln(ans);
  if(ans='Christopher Colombus') then
    score:=score+1 {if this does not execute,}
  else
    writeln('Sorry, you''ve got it wrong!'); {then this execute}
  readln;
end.
