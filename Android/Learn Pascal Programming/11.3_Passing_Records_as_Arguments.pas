program Project1;
Type
  Str25=string[25];
  TBookRec=
    record
      Title, Author, ISBN:str25;
      Price:real;
    end;

Procedure EnterNewBook(Var newBook:TBookRec);
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

Procedure DisplayBookDetails(myBookRec:TBookRec);
begin
  writeln('Here are the book details: ');
  writeln;
  writeln('Title: ',myBookRec.Title);
  writeln('Author: ',myBookRec.Author);
  writeln('ISBN: ',myBookRec.ISBN);
  writeln('Price: ',myBookRec.Price);
end;

var
  bookRec:TBookRec;

begin
  enterNewBook(bookrec);
  writeln('Thanks for entering the book details');
  DisplayBookDetails(bookrec);
  readln;
end.

{Passing Records as Arguments
It may become very useful when records are required to be passed through
arguments and this will be demonstrated shortly. I will use the same data structure,
pass it by reference as a parameter and return the value back through
the parameter also.}
