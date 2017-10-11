<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String kode=request.getParameter("kode");
String satuan=request.getParameter("satuan");
String harga=request.getParameter("harga");
String beli=request.getParameter("beli");
String q="update harga set barang_id='"+kode+"',satuan_id='"+satuan+"',harga_harga='"+harga+"',harga_beli='"+beli+"' where harga_id='"+id+"'";
c.ManipulasiData(q);
%>