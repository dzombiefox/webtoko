<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    connect c=new connect();
String idNya=request.getParameter("idNya");
String idSatuan=request.getParameter("idSatuan");
String jumlah=request.getParameter("jumlah");
int jml=Integer.parseInt(jumlah);
String rjumlah=request.getParameter("rjumlah");
String rsatuan=request.getParameter("rsatuan");
String cek="select jumlah_jumlah from jumlah where barang_id='"+idNya+"' and satuan_id='"+idSatuan+"' ";
ResultSet rs=c.GetData(cek);
rs.next();
int jum=rs.getInt("jumlah_jumlah");
int total1=jml * jum;
String cek2="select jumlah_jumlah from jumlah where barang_id='"+idNya+"' and satuan_id='"+rsatuan+"' ";
ResultSet rst=c.GetData(cek2);
rst.next();
int jum2=rst.getInt("jumlah_jumlah");
int jml2=Integer.parseInt(rjumlah);
int total2=jum2*jml2;
float kurang=total1-total2;
String cekHarga="select harga_harga from harga where barang_id='"+idNya+"' and satuan_id='"+rsatuan+"'";
ResultSet rh=c.GetData(cekHarga);
rh.next();
float harga=rh.getFloat("harga_harga");
float totalHarga=harga*jml2;
if(kurang<=-1){
out.print(1);
}
else{
out.print(totalHarga);
}%>
