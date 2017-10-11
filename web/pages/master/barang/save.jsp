<%@page import="config.connect"%>
<%
connect c=new connect();
String kd=request.getParameter("kd");
String nm=request.getParameter("nm");
String kt=request.getParameter("kt");
String q="insert into barang(barang_kode,barang_nama,kategori_id)values('"+kd+"','"+nm+"','"+kt+"')";
c.ManipulasiData(q);

%>
