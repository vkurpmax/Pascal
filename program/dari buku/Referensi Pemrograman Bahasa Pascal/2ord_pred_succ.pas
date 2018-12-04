program ord_pred_succ;
var
  model:(small,medium,large);

begin
  model:=medium;
  writeln(ord(model));
  model:=pred(model);
  writeln(model);
  model:=succ(succ(model));
  writeln(model);
  readln;
end.  
