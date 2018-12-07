program Project1;
var
  UFile:text;

begin
  assign(UFile, 'c:\ADDTEXT.TXT');
  append(UFile);
  writeln(UFile, 'How many lines, '+'are present in this file?');
  close(UFile);
end.
