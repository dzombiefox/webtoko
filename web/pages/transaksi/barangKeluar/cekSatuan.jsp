<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String query="select A.satuan_id ,B.satuan_nama from jumlah A join satuan B on A.satuan_id=B.satuan_id WHERE A.barang_id='"+kode+"' ";
ResultSet rs=c.GetData(query);
while(rs.next()){
out.print("<option value='"+rs.getString("satuan_id") +"'>"+rs.getString("satuan_nama") +"</option>");
}
%>