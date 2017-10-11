<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String barang=request.getParameter("barang");
String satuan=request.getParameter("satuan");
String query="select harga_harga from harga where barang_id='"+barang+"' and satuan_id='"+satuan+"'";
ResultSet rs=c.GetData(query);
rs.next();
out.print(rs.getString("harga_harga"));

%>