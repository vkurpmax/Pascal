program Project1;

{$mode objfpc}{$H+}

uses
  crt,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

var
  answer:integer;
  guess:integer;
  cnt:integer;
  error:integer;
  game:char;
  UI:string;

begin
  repeat
  cnt := 0;

    repeat
      clrscr;
      writeln('Please Select A Game: ');
      writeln;
      writeln('A) 10');
      writeln('B) 100');
      writeln('C) 1000');
      writeln;
      write('Enter Selection: ');
      readln(game);
    until (game = 'A') or (game = 'a') or (game = 'B') or (game = 'b')
          or (game = 'C') or (game = 'c');

    clrscr;

    randomize;

    case game of
    'A', 'a':begin
      answer:= random(10)+1;
      writeln('Game 1 - 10');
      end;
    'B', 'b':begin
      answer:=random(100)+1;
      writeln('Game 1 -100');
      end;
    'C', 'c':begin
      answer:=random (1000)+1;
      writeln('Game 1 - 1000');
      end;
    end;

    repeat
      repeat
        writeln;
        write('Enter A Guess: ');
        readln(UI);
        val(UI,guess,error);
        if error <> 0 then
        writeln('Incorrect Input - Please Try Again');
      until error = 0 ;

      cnt:= cnt + 1;

      if guess < answer then
      writeln('Too Low!')
      else if guess > answer then
      writeln('Too High!')
      else
      writeln('You Guessed My Number In ', cnt, ' Guesses!');

    until guess = answer ;

    writeln;

    repeat
    write('Play Again Y/N: ');
    readln(game);
    until(game = 'Y') or (game = 'y') or (game = 'N') or (game = 'n');

  until (game = 'N') or (game = 'n');

end.
