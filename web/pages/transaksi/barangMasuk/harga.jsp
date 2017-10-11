<%@page import="config.connect"%>
<%@page import="java.sql.ResultSet"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String satuan=request.getParameter("satuan");
String cekHarga="select harga_beli from harga where satuan_id='"+satuan+"' and barang_id='"+kode+"'";
ResultSet rs=c.GetData(cekHarga);
rs.next();
out.print(rs.getString("harga_beli"));
%>