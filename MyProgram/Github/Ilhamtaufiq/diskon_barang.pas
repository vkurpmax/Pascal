program diskon_barang;
var
total,jumlah_barang,harga,disc,hbd: Real;
{ket: hbd=harga belum diskon}
const
diskon = 0.1;
begin
writeln('=====================================');
writeln(' Aplikasi Diskon Penjualan Barang');
writeln('=====================================');
write('Harga Barang = ');readln(harga);
write('Jumlah Barang = ');readln(jumlah_barang);

if jumlah_barang <=10 then
  begin
    total:=(harga*jumlah_barang);
    writeln('Total Bayar = ',total:8:0);
    writeln('Keterangan : Tidak mendapat diskon ');
  end
  else
  begin
    hbd:=(harga*jumlah_barang);
    disc:=(hbd*diskon);
    total:=(hbd-disc);
    writeln('Total Bayar = ',total:8:0);
    writeln('Keterangan : Mendapat Diskon ');
  end;
readln;
end.
