program Program1b_lesson5;
uses crt;

label return; {used respectively with the goto statement; not recommended}

var SEL:integer;
  YN: char;

begin
  return:clrscr;
  writeln('[1].PLAY GAME');
  writeln('[2].LOAD GAME');
  writeln('[3].MULTIPLAYER');
  writeln('[4].EXIT GAME');
  writeln('note: Do not press anything except');
  writeln('numbers; otherwise an error occurs!');
  readln(sel);

  case SEL of
    1: begin
      writeln('You will soon be able to create');
      writeln('games using Pascal Programming :-)');
      delay(2000);
      goto return;
    end;

    2:begin
      writeln('Ahhh... no saved games');
      delay(2000);
      goto return;
    end;

    3:begin
      writeln('networking or 2 players?');
      delay(2000);
      goto return;
    end;

    4:begin
      writeln('Exit?');
      yn:=readkey;
      case yn of {a sort of a nested case statement}
        'y':begin
          writeln('Good Bye...');
          delay(2000);
          halt;
        end;
        'n':goto return;
      end; {End Case 2}
    end; {Close Conditional Expression 4}

  end; {End Case 1}
end.
