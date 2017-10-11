<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String satuan=request.getParameter("satuan");
String harga=request.getParameter("harga");
String beli=request.getParameter("beli");
String query="insert into harga(barang_id,satuan_id,harga_harga,harga_beli)values('"+kode+"','"+satuan+"','"+harga+"','"+beli+"')";
c.ManipulasiData(query);
%>