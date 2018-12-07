program Program2_Lesson5;
uses crt;
label return; {avoid it}
var YN:char;

begin
  return:clrscr;
  writeln('Exiting?');
  YN:=readkey;
  case yn of
    'y':halt;
    'n':begin
      writeln('What are you going to do here, anyway?');
      delay(2000);
      halt;
    end;
    else
      begin
        writeln('Press either ''y'' for yes');
        writeln('or ''n'' for no.. please try again..');
        delay(3500);
        clrscr;
        goto return;
      end;
  end; {CASE}
end. {PROGRAM}
