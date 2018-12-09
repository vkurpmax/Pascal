program Lesson8_Program4;
uses
  WinDos, Dos; {note the inclusion of the 'windos.tpu' library}

var
  NewDir:pathstr; {for searching the dir and create a new one, if it does not exist}
  f:text;

begin
  {search for the dir}
  NewDir:=FSearch('C:\Pascal Programming'), GetEnv(''));
  {create a new one, if it does not exist}
  if NewDir='' Then
    createDir('C:\Pascal Programming');
  assign(F,'C:\Pascal Programming\pprogramming.txt');
  {$I+} rewrite(F); {$I-} {disable and enable back again i/o error checking}
  {write to text file}
  writeln(F,'http://pascal-programming.info/');
  {$I+} close(F); {$I-}
end.
    
