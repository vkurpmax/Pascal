program ProgramTextColor;
uses crt;

begin
  textbackground(red); {word - red}
  writeln('Text colour');
  textcolor(5); {integer - 5}
  writeln('Text colour');
  readln;
end. 
