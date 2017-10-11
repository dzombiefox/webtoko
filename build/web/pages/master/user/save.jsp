<%@page import="config.connect"%>
<%
connect c=new connect();
String nama=request.getParameter("nama");
String username=request.getParameter("username");
String password=request.getParameter("password");
String level=request.getParameter("level");

String query="insert into admin(nama,username,password,lev)values('"+nama+"','"+username+"','"+password+"','"+level+"')";
c.ManipulasiData(query);
%>