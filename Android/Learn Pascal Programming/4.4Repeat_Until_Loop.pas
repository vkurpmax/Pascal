program repeat_until_loop;
uses crt;
var YN:string;

begin
  repeat {repeat the code for at least one time}
    clrscr;
    writeln('Y(YES) or N(NO)?');
    Readln(YN);
    if yn='y' then halt; {halt - exit}
    if yn='n' then writeln('Why not? Exiting...');
    delay(1800); {wait a second plus 800 milliseconds}
  until(YN='y')or(yn='n');
end.
