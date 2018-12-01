program diskon_barang;
var
total,jumlah_barang,harga: Real;
const
diskon = 0.1;
begin
writeln('=====================================');
writeln(' Aplikasi Diskon Penjualan Barang');
writeln('=====================================');
write('Harga Barang = ');readln(harga);
write('Jumlah Barang = ');readln(jumlah_barang);
total:=(harga*jumlah_barang)-(harga*diskon);
writeln('Total Bayar = ',total:8:0);
if jumlah_barang <=10 then
begin
writeln('Keterangan : Tidak mendapat diskon ');
end
else
begin
writeln('Keterangan : Mendapat Diskon ');
end;
readln;
end.
