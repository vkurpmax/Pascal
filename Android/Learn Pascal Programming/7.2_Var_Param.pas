program Lesson7_Program3;
uses crt;
var
  UName,USurn,UCoun,UMail:string[50];
  {These var's are global because they are used by declared in the main program}
  TxtB,TxtC,i:integer;
  infocor:boolean;

Procedure EnterUserInfo(TxtCol:smallint; TxtBck:smallint);
begin
  textcolor(Txtcol);
  textbackground(txtbck);
  clrscr;
  write('Your Name: ');
  readln(UName);
  write('Your Surname: ');
  readln(Usurn);
  write('Country: ');
  readln(Ucoun);
  write('E-mail Address: ');
  readln(UMail);
  write('Thank you for entering your personal information!!');
  readkey;
end;

procedure confirmationField(TxtCol:smallint; txtbck:smallint);
var
  YN:char; {a local variable}

begin textcolor(txtcol);
  textbackground(txtbck);
  clrscr;
  writeln('Your Name: ',UName);
  writeln('Your Surname: ',Usurn);
  writeln('Country: ',UCoun);
  writeln('E-Mail Address: ',UMail);
  writeln;
  writeln;
  writeln('This is a confirmation field. Please verify that');
  writeln('Your information is correct!');
  writeln;
  write('Is your personal information all correct? ([Y/N] ');
  repeat
    YN:=readkey;
    case YN of
      'N':Infocor:=false;
      'Y':infocor:=true;
    end;
  until (YN='N') or (YN='Y');
end;

begin {main program}
  infocor:=true;
  clrscr;
  textbackground(cyan);
  textcolor(green);
  writeln('A list of colours is being displayed...');

  for i:=1 to 17 do
  begin
    case i of
      16:begin
        textbackground(white);
      end;
    end;
    textcolor(i);
    writeln(i);
    writeln(i,': This is Colour No.',i);
    Delay(500);
  end;

  textbackground(black);
  textcolor(white);
  write('Please, put into your mind your favorite colour. ');
  write('When you are ready press any key...');
  readkey;
  clrscr;
  write('Enter your favorite text colour: (only numbers) ');
  readln(txtB);
  writeln;
  writeln;
  write('Now, you must enter your personal information. ');
  write('Hit any key to continue...');
  clrscr;
  enteruserinfo(txtc,txtb);
  confirmationfield(txtc,txtb);

  if infocor=false then
  repeat
    writeln;
    writeln('You verified that your information is, for some reason, incorrect.');
    writeln('You are now going to re-enter your correct information. Hit any key..');
    readkey;
    enteruserinfo(txtc,txtb);
    clrscr;
    confirmationfield(txtc,txtb);
  until infocor=true;
end.
