program lesson3_program1;
uses crt; {We will make use of the crt library}
var
  PD,Dname,Cmodel:string;
  CostPD,TCostPD,Distance:Real;
  {real is a decimal (described later on)}

begin
  textbackground(brown); {background colour}
  clrscr; {Clear screen with a brown colour. Try run the program without this..}
  textcolor(lightgreen); {text colour}

  TCostPD:=0;
  Writeln('This program prompts you to '+'input the cost per litre of');
  writeln('the petrol/diesel you spend in and '+'the average distance you travel');
  writeln('the computer calculates the total cost');
  writeln('you spend in fuel every week.');
  readkey; {program move on as soon as a key is pressed}

  clrscr; {short for clear screen}
  gotoxy(28,3); {move to a position on the screen: x (horizontal, y (vertical)}
  write('Diesel or Petrol? Type p or d: ');
  PD:=readkey; {as soon as a key is pressed, it is stored in the variable 'PD'}

  gotoxy(30,4);
  write('Name of Driver: ');
  readln(Dname);
  gotoxy(30,5);
  write('Car Model: ');
  readln(Cmodel);
  gotoxy(29,6);
  write('Cost of Diesel/Petrol: ($) ');
  readln(CostPD);
  gotoxy(8,7);
  writeln('Average distance you travel with '+'your car every week: (kilometres) ');
  readln(Distance);

  clrscr;
  gotoxy(28,3);
  writeln('Name of Driver: ',Dname);
  gotoxy(31,4);
  delay(500);
  writeln('Car Model: ',Cmodel);
  gotoxy(32,5);
  delay(500);
  writeln('Diesel/Petrol: ',PD);
  gotoxy(8,6);
  delay(500);
  writeln('Average distance covered '+'every week: ',Distance:1:2,'Km');
  gotoxy(25,7);
  delay(500);
  writeln('Cost of ',PD,' per litre: $',CostPD:1:2,'/litre');
  writeln;
  delay(500);
  writeln;

  TCostPD:=distance*costPD;
  gotoxy(21,10);
  writeln('Total cost of ',PD,' per week:$',TCostPD:1:2);
  TcostPD:=0;
  gotoxy(21,12);
  writeln('Total cost of ',PD,' per week:'+'$',(Distance*CostPD):1:2);
  gotoxy(18,14);
  writeln('Total cost of ',PD,' per week:$',distance*costPD);

  readln;
end.
