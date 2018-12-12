program ex;
var a,b,f,fa,fb,eps,x:real;

begin
  writeln('Vvedite a, b i epsilon:');
  readln(a,b,eps);
  fa:=a*a-1;
  fb:=b*b-1;
  if a*fb>=0 then writeln('Metod ne primenim.')
  else
    begin
      x:=(b-2)*abs(fa)/abs(fa-fb)+a;
      f:=x*x-1;
      while abs(f)>=eps do          {условие выхода из цикла}
      begin
        if fa*f<0 then
        begin b:=x; fb:=f; end
      else begin a:=x; fa:=f; end;
      x:=(b-a)*abs(fa)/abs(fa-fb)+a;
      f:=x*x-1;
      end;
      writeln('Pri x= ',x:9:6,' y= ', f:10:8);
    end;
end.
