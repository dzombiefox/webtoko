<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String query="select * from jumlah";
ResultSet rs=c.GetData(query);
int total=0;
while(rs.next()){
int jumlah=rs.getInt("jumlah_jumlah");
total*=jumlah;
}
out.print(total);
%>