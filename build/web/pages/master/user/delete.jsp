<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String query="delete from admin where id='"+id+"'";
c.ManipulasiData(query);
%>
