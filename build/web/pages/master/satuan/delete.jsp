<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String query="delete from jumlah where jumlah_id='"+id+"'";
c.ManipulasiData(query);
String que="delete from tingkat where jumlah_id='"+id+"'";
c.ManipulasiData(que);
%>
