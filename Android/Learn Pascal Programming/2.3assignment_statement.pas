program lesson2_program3;
var
  PD,Dname,Cmodel:string;
  totalKM,CostPD,TCostPD,Distance:real;
  {real is a decimal}

begin
  TcostPD:=0;        {note that this is called an
  'initialisation'. It is important to initialise variables
  to 0 so that it is 'refreshed' from the previous
  'rubbish' value in the memory}

  writeln('This program prompts you to '+'input the cost per litre of');
  writeln('the petrol/diesel you spend '+'in and the average distance you travel');
  writeln('with your car every week. Then '+'the computer calculates the total cost');
  writeln('you spend in fuel every week.');
  readln;

  write('Diesel or Petrol?: ');
  readln(PD);
  writeln('Name of Driver: ');
  readln(Dname);
  write('Car Model: ');
  readln(Cmodel);
  write('cost of Diesel/Petrol: ($) ');
  readln(CostPD);
  writeln('Average distance you travel '+'with your car every week: (kilometres) ');
  readln(distance);

  writeln;
  writeln;

  writeln('Name of Driver: ',Dname);
  writeln('Car Model: ',Cmodel);
  writeln('Diesel/Petrol: ',PD);
  writeln('Average distance covered '+'every week: ',Distance:1:2,'Km');
  writeln('Cost of ',pd,' per liter: $',costpd:1:2,'/litre');

  writeln;
  writeln;

  tcostpd:=distance*costpd;
  writeln('Total cost of ',pd,' per week:'+'$',tcostpd:1:2);            {note this,}
  tcostpd:=0;
  writeln('Total cost of ',pd,' per week:'+'$',(Distance*costpd):1:2);  {this}
  writeln('Total cost of ',pd,' per week:'+'$',distance*costpd);        {and this - without ':1:2'}
  readln;
end. 
