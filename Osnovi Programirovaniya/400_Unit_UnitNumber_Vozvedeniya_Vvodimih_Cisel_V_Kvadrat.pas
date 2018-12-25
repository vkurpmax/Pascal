unit UnitNumber;

{$mode objfpc}{$H+}

interface
Type
  TNumber=class(TObject)
    private Num:single;
    public Constructor Create(aNum:single);
           Function SqrNumber:single;
  end;

var
    N:TNumber;

implementation
Constructor TNumber.Create(aNum:single);
  begin
    inherited Create;
    Num:=aNum;
  end;
  Function TNumber.SqrNumber:single;
  begin
    Result:=Sqr(Num);
  end;

end.
