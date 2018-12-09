program Project1;
Type
  str25=string[25];
  TBookRec=
    record
      Title,Author,ISBN:str25;
      Price:real;
    end;

Procedure EnterNewBook(var newBook:TBookRec);
begin
  writeln('Please enter the book details: ');
  write('Book Name: ');
  readln(newBook.title);
  write('Author: ');
  readln(newBook.Author);
  write('ISBN: ');
  readln(newBook.ISBN);
  write('Price: ');
  readln(newBook.Price);
end;

var
  bookRecArray:array[1..10] of TBookRec;
  tempBookRec:TBookRec;
  bookRecFile:File of TBookRec;
  i:1..10;

begin
  assign(bookRecFile, 'bookrec.dat');
  reWrite(bookRecFile);

  for i:=1 to 10 do
  begin
    EnterNewBook(bookRecArray[i]);
    {bookRecArray[i] now contains the book details}
    write(bookRecFile,bookRecArray[i]);
  end;

  close(bookRecFile);
  writeln('Thanks for entering the book details.');
  writeln('They are saved in a file!');
  write('Now choose a record to display from 1 to 10: ');
  readln(i);
  ReSet(bookRecFile);
  seek(bookRecFile,i-1);
  read(bookRecFile,tempBookRec);
  Close(bookRecFile);
  writeln('Here are the book details of record #',i,':');
  writeln;
  writeln('Title: ',tempBookRec.Title);
  writeln('Author: ',tempBookRec.Author);
  writeln('ISBN: ',tempBookRec.ISBN);
  writeln('Price: ',tempBookRec.Price);
  readln;
end.
