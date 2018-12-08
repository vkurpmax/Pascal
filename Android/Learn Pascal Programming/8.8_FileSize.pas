program Lesson8_Program4;
var
  f:file of byte; {file var of type byte}
  sz:longint; {var for the size}

begin
  assign(f,'c:\anyfile.txt');
  {$I-} reset(f); {$I+}
  if (IOResult then
  begin {file found?}
    writeln('File not found.. exiting');
    readln;
  end else
  begin
    {return the file size in kilobytes}
    sz:=round(filesize(f)/1024);
    writeln('Size of the file in Kilobytes: ',sz,' Kb');
    readln;
    close(f);
  end;
end. 
