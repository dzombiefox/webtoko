<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String sb=request.getParameter("sb");
String sk=request.getParameter("sk");
String query="select * from jumlah where barang_id='"+kode+"' and satuan_id='"+sb+"' and satuan_besar='"+sk+"'";
ResultSet rs=c.GetData(query);
if(rs.next()){
out.print(0);
}
else{
out.print(1);
}

%>