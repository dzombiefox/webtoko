<%@page import="config.connect"%>
<%
connect c=new connect();
String kd=request.getParameter("kd");
String nm=request.getParameter("nm");
String kt=request.getParameter("kt");
String q="update barang set barang_kode='"+kd+"',barang_nama='"+nm+"',kategori_id='"+kt+"' where barang_kode='"+kd+"'" ;
c.ManipulasiData(q);

%>
