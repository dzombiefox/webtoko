<%@page import="config.connect"%>
<%
connect c=new connect();
String kd=request.getParameter("kd");
String q="delete from barang where barang_kode='"+kd+"'";
c.ManipulasiData(q);
%>