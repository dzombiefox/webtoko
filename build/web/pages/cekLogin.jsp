<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String username=request.getParameter("username");
String password=request.getParameter("password");
String query="select * from admin where username='"+username+"'";
ResultSet rs=c.GetData(query);
if(rs.next()){
String id=rs.getString("id");
String nama=rs.getString("username");
String pass=rs.getString("password");
String level=rs.getString("lev");
if(pass.equals(password)){
 session.setAttribute("id",id);
 session.setAttribute("nama",nama);
 session.setAttribute("level",level);
 Cookie user_cookie=new Cookie("username",nama);
 response.addCookie(user_cookie);
 out.print("1");
}
else{
out.print("0");
}
}
else{
out.print("0");
}
%>