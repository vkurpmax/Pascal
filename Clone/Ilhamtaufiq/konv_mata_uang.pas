program Konversi_Mata_Uang;
var
rupiah,dollar,yen,won,euro,poundsterling: Real;
pil: Integer;
begin
writeln('========== Konversi Mata Uang ==========');
writeln('1. Rupiah ke Mata Uang Asing');
writeln('2. Mata Uang Asing ke Rupiah');
writeln();
write('Silahkan Pilih Menu = ');readln(pil);
if pil=1 then
begin
writeln('==========Rupiah ke Mata Uang Asing=========');
writeln('1. Rupiah ke Dollar');
writeln('2. Rupiah ke Yen');
writeln('3. Rupiah ke Won');
writeln('4. Rupiah ke Euro');
writeln('5. Rupiah ke Poundsterling');
end
else
writeln('==========Mata Uang Asing ke Rupiah=========');
writeln('1. Dollar ke Rupiah');
writeln('2. Yen ke Rupiah');
writeln('3. Won ke Rupiah');
writeln('4. Euro ke Rupiah');
writeln('5. Poundsterling ke Rupiah');
begin

end;
end. 
