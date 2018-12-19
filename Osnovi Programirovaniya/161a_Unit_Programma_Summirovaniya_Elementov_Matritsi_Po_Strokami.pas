unit Summa3;

{$mode objfpc}{$H+}

interface
  Function sum(b:array of integer):integer;


implementation
  Function sum(b:array of integer):integer;
    var s:integer;  i:integer;
    begin
      s:=0;
      for i:=0 to high(b) do
        s:=s+b[i];
      sum:=s;
    end;

end.
