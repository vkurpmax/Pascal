program Project1;
Type
  str25=string[25];
  TBookRec=
    record
      Title, Author,ISBN:Str25;
      Price:real;
    end;

Procedure EnterNewBook(var newBook:TBookRec);
begin
  writeln('Please enter the book details: ');
  write('Book Name: ');
  readln(newBook.Title);
  write('Author: ');
  readln(newBook.Author);
  write('ISBN: ');
  readln(newBook.ISBN);
  write('Price: ');
  readln(newBook.Price);
end;

var
  bookRecArray:Array[1..10] of TBookRec;
  i:1..10;

begin
  for i:=1 to 10 do
    EnterNewBook(bookRecArray[i]);

  writeln('Thanks for entering the book details');
  write('Now choose a record to display from 1 to 10: ');
  readln(i);
  writeln('Here are the book details of record #',i,':');
  writeln;
  writeln('Title: ',bookRecArray[i].Title);
  writeln('Author: ',bookRecArray[i].Author);
  writeln('ISBN: ',bookRecArray[i].ISBN);
  writeln('Price: ',bookRecArray[i].Price);
  readln;
end.
