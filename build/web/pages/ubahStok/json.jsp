<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
int n=0;
connect c=new connect();
String query="select a.*,b.barang_nama from rstok a join barang b on a.barang_id=b.barang_id";
ResultSet rs=c.GetData(query);
JSONArray js=new JSONArray();
while(rs.next()){
    n++;
    String no=Integer.toString(n);
String[]value={
no,
rs.getString("rstok_tanggal"),
rs.getString("barang_nama"),
rs.getString("rstok_satuan"),
rs.getString("rstok_awal"),
rs.getString("rstok_akhir"),
rs.getString("rstok_keterangan")
};
js.put(value);
}
String x=js.toString();
String replace1=x.replace("{", "[");
String replace2=replace1.replace("}","]");
String replace3=replace2.replace(":",",");
out.print("{\"aaData\":"+replace3+"}");
%>