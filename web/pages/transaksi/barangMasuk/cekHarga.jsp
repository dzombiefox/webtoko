<%@page import="config.connect"%>
<%@page import="java.sql.ResultSet"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String satuan=request.getParameter("satuan");
String cekHarga="select harga_beli from harga where satuan_id='"+satuan+"' and barang_id='"+kode+"'";
ResultSet rs=c.GetData(cekHarga);
if(rs.next()){
out.print(0);
}
else{
out.print(1);
}
%>