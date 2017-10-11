<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String query="delete from suplier where suplier_id='"+id+"'";
c.ManipulasiData(query);
%>