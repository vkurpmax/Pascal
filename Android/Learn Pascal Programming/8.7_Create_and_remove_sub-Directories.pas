program Lesson8_Program3;
uses crt;

var
  t:text;
  s:string;

begin
  assign(t, 'c:\ABC.DEF');
  {$I+} {enable again i/o error checking - important}
  if (IOResult then
  begin
    writeln('The file required to be opened is not found!');
    readln;
  end else
  begin
    readln(t,s);
    writeln('The first line of the file reads: ',s);
    close(t);
  end;
end.
