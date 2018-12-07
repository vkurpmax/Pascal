program Project1;
var
  UFile:text;

begin
  assign(UFile, 'c:\ADDTEXT.TXT');
  rewrite(Ufile);
  writeln(UFile, 'How many lines ' + 'are there in this file?');
  close(UFile);
end.
