program Project1;
type
  myArrayDataType=array[1..5] of byte;
  byteFile=file of byte; {binary file}

var
  j:integer;
  myArrayVar:myArrayDataType;
  myFile:byteFile;

begin
  writeln('Please enter 5 number from (0..255): ');

    for j:= 1 to 5 do
    readln(myArrayVar[j]);

    writeln('You have entered the following numbers: ');

    for j:=1 to 5 do
    writeln('Number ',j,':',myArrayVar[j]);

    writeln('Now writing them to file...'); {store the numbers in a file}
  assign(myFile, 'example.dat');
  Rewrite(myfile);
  write(myFile, myArrayVar[j]);
  close(myFile);
  writeln('Done, you may exit..');
  readln;
end.
