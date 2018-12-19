program ex;
uses Dos;

begin
  writeln('Visivaem docerniy protsess ...');
  SwapVectors;
  Exec('c:\utils\bitmap.exe','r24.pcx');
  SwapVectors;
  writeln('... vernulis v osnovnuyu programmu');
  if DosError<>0 then  {если есть ошибка при вызове дочернего процесса}
    writeln('Oshibka DOS #',DosError)
  else
    writeln('Docerniy Protsess vizvan. Kod zaversheniya =',DosExitCode);  {код
      завершения дочернего процесса}
    readln;
end.
