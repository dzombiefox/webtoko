<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String nama=request.getParameter("nama");
String alamat=request.getParameter("alamat");
String telp=request.getParameter("telp");
String fax=request.getParameter("fax");
String query="update suplier set suplier_nama='"+nama+"',suplier_alamat='"+alamat+"',suplier_noTelp='"+telp+"',suplier_fax='"+fax+"' where suplier_id='"+id+"'";
c.ManipulasiData(query);
%>