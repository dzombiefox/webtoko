<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
int n=0;
connect c=new connect();
String query="select  B.barang_kode,B.barang_nama,C.satuan_nama,A.detailJumlah_id,A.detailJumlah_jumlah,A.detailJumlah_satuanDetail from detailJumlah A join barang B on A.barang_id=B.barang_id join satuan C on A.satuan_id=C.satuan_id order by A.detailJumlah_id desc";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
n++;
String no=Integer.toString(n);
String[] value = {
no,
rs.getString("detailJumlah_id"),
rs.getString("barang_nama"),
rs.getString("satuan_nama"),
rs.getString("detailJumlah_jumlah"),
rs.getString("detailJumlah_satuanDetail"),
};
 js.put(value);
}
String x=js.toString();
String replace1=x.replace("{", "[");
String replace2=replace1.replace("}","]");
String replace3=replace2.replace(":",",");
out.print("{\"aaData\":"+replace3+"}");
%>
