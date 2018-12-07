program Lesson8_Program1;

var userFile:text;
  FileName,TFile:string;

begin
  writeln('Enter the file name (including its full path) of the text file: ');
  readln(filename); {A .txt file will be assigned to a text variable}
  assign(userfile,filename + '.txt');
  reset(userfile); {'Reset(x)' - means open the file x}
  repeat
    readln(userfile,tfile);
    writeln(tfile);
  until Eof(userfile);
  close(userfile);
  readln;
end.
