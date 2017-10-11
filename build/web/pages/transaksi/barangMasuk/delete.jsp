<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String jumlah=request.getParameter("jumlah");
String idBrg=request.getParameter("idBrg");
int jml=Integer.parseInt(jumlah);
String cekStok="select stok_jumlah from stok where barang_id='"+idBrg+"'";
ResultSet rs=c.GetData(cekStok);
rs.next();
int stok=rs.getInt("stok_jumlah");
int sisa=stok-jml;
String q="delete from masuk where masuk_id='"+id+"'";
c.ManipulasiData(q);
String updateStok="update stok set stok_jumlah='"+sisa+"' where barang_id='"+idBrg+"'";
c.ManipulasiData(updateStok); 
%>