<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String barang=request.getParameter("barang");
String satuan=request.getParameter("satuan");
String jumlah=request.getParameter("jumlah");
int jml=Integer.parseInt(jumlah);
String cekBarang="select jumlah_jumlah from jumlah where barang_id='"+barang+"' and satuan_id='"+satuan+"'";
ResultSet rs=c.GetData(cekBarang);
rs.next();
int jum=rs.getInt("jumlah_jumlah");
int calc=jum*jml;
String cekStok="select stok_jumlah from stok where barang_id='"+barang+"'";
ResultSet r=c.GetData(cekStok);

if(r.next()){
int stok=r.getInt("stok_jumlah");
int cek=stok-calc;
if(cek<0){
out.print("0");
}
else{
out.print("1");
}
}
else{
out.print("2");
}

%>