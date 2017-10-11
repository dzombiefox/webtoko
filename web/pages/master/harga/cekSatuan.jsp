
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    String kode=request.getParameter("kode");
connect c=new connect();
String q="select B.barang_id,B.barang_kode,B.barang_nama,C.satuan_id,C.satuan_nama,A.jumlah_id,A.jumlah_jumlah,A.jumlah_detail from jumlah A join barang B on A.barang_id=B.barang_id join satuan C on A.satuan_id=C.satuan_id where B.barang_id='"+kode+"' order by A.jumlah_id desc";
ResultSet rs=c.GetData(q);
while(rs.next()){
out.print("<option value="+rs.getString("satuan_id")+">"+rs.getString("satuan_nama")+"</option>");
}
%>