<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String query="delete from harga where harga_id='"+id+"'";
c.ManipulasiData(query);
%>
