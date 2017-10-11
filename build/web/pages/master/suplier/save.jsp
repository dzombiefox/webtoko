<%@page import="config.connect"%>
<%
connect c=new connect();
String nama=request.getParameter("nama");
String alamat=request.getParameter("alamat");
String telp=request.getParameter("telp");
String fax=request.getParameter("fax");
String query="insert into suplier(suplier_nama,suplier_alamat,suplier_noTelp,suplier_fax)values('"+nama+"','"+alamat+"','"+telp+"','"+fax+"')";
c.ManipulasiData(query);
%>