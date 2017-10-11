<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String tanggal=request.getParameter("tanggal");
String kode=request.getParameter("kode");
String satuan=request.getParameter("satuan");
//String harga=request.getParameter("harga");
String keterangan=request.getParameter("keterangan");
String jumlah=request.getParameter("jumlah");
String ref=request.getParameter("ref");
String suplier=request.getParameter("suplier");
//String total=request.getParameter("total");
int jml=Integer.parseInt(jumlah);
String hr=request.getParameter("harga");
Float harga=Float.parseFloat(hr);

String cek="select jumlah_jumlah from jumlah where barang_id='"+kode+"' and satuan_id='"+satuan+"' ";
ResultSet rs=c.GetData(cek);
rs.next();
int jum=rs.getInt("jumlah_jumlah");
int x=jum*jml;
String cari="select barang_id from stok where barang_id='"+kode+"'";
ResultSet rst=c.GetData(cari);
if(!rst.next()){
String q="insert into stok(barang_id,stok_jumlah)values('"+kode+"','"+x+"')";
c.ManipulasiData(q);
}
else{
String barang=rst.getString("barang_id");
String cekBarang="select stok_jumlah from stok where barang_id='"+kode+"'";
ResultSet rsl=c.GetData(cekBarang);
rsl.next();
int stok=rsl.getInt("stok_jumlah");
int stokBarang=stok+x;
String update="update stok set stok_jumlah='"+stokBarang+"' where barang_id='"+kode+"' ";
c.ManipulasiData(update);
}
String cekHarga="select harga_beli from harga where satuan_id='"+satuan+"' and barang_id='"+kode+"'";
ResultSet rt=c.GetData(cekHarga);
rt.next();
String hargaBeli=rt.getString("harga_beli");
String query="insert into masuk(masuk_tanggal,barang_id,satuan_id,masuk_jumlah,masuk_detailJumlah,masuk_keterangan,masuk_referensi,suplier_id,masuk_harga)values('"+tanggal+"','"+kode+"','"+satuan+"','"+jumlah+"','"+x+"','"+keterangan+"','"+ref+"','"+suplier+"','"+hargaBeli+"')";
c.ManipulasiData(query);
String update="update harga set harga_beli='"+harga+"' where barang_id='"+kode+"' and satuan_id='"+satuan+"' ";
c.ManipulasiData(update);

%>
