program Project1;
Type
  str25=String[25];
  TBookRec=Record
    Title, Author, ISBN:str25;
    price:real;
  end;

var
  myBookRec:TBookRec;

begin
  myBookRec.Title:='Some Book';
  myBookRec.Author:='Victor John Saliba';
  myBookRec.ISBN:='0-12-345678-9';
  myBookRec.Price:=25.5;

  writeln('Here are the book details:');
  writeln;
  writeln('Title: ',mybookrec.title);
  writeln('Author: ',mybookrec.author);
  writeln('ISBN: ',mybookrec.ISBN);
  writeln('Price: ',myBookRec.Price);
  readln;
end.
