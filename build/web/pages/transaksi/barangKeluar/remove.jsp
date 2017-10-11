<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String query="select * from detail where keluar_kode='"+kode+"'";
ResultSet rs=c.GetData(query);
while(rs.next()){
String barang=rs.getString("barang_id");
String satuan=rs.getString("satuan_id");
int jumlah=rs.getInt("detail_jumlah");
String cekBarang="select jumlah_jumlah from jumlah where barang_id='"+barang+"' and satuan_id='"+satuan+"'";
ResultSet rsl=c.GetData(cekBarang);
rsl.next();
int jum=rsl.getInt("jumlah_jumlah");
int calc=jum*jumlah;
String cekStok="select stok_jumlah from stok where barang_id='"+barang+"'";
ResultSet r=c.GetData(cekStok);
r.next();
int stok=r.getInt("stok_jumlah");
int plus=calc+stok;
String update ="update stok set stok_jumlah='"+plus+"' where barang_id='"+barang+"'";
c.ManipulasiData(update);
String delete="delete from detail where keluar_kode='"+kode+"'";
c.ManipulasiData(delete);
}
String qu="delete from keluar where keluar_kode='"+kode+"'";
c.ManipulasiData(qu);

%>