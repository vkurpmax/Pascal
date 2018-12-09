program Lesson8_Program2;
var
  FName,Txt:string[10];
  UserFile:Text;

begin
  Fname:='Textfile';
  assign(userfile, 'c:\'+FName+'.txt'); {assign a text file}
  rewrite(userfile); {open the file 'fname' for writing}
  writeln(userfile, 'PASCAL PROGRAMMING');
  writeln(userfile, 'if you did not understand something,');
  writeln(userfile, 'please send me an email to:');
  writeln(userfile, 'victorsaliba@gmail.com');
  writeln('write some text to the file:');
  readln(txt);
  writeln(userfile, '');
  writeln(userfile, 'The user entered this text:');
  writeln(userfile,txt);
  close(userfile);
end.
