program Project1;
var
  UFile:Text; {or it could be of 'file' type}

begin
  assign(Ufile, 'h:\ADDTEXT.TXT');
  erase(UFile);
end.
