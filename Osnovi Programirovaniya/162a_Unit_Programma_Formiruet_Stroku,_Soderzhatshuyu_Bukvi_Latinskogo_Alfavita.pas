unit Stroka;

{$mode objfpc}{$H+}

interface
  Procedure Add(var s:openstring);


implementation
  Procedure Add(var s:openstring);
    begin
      s:=s+chr(succ(Ord(s[length(s)])));
    end;

end.
