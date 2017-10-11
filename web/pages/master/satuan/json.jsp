<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
int n=0;
connect c=new connect();
String query="select B.barang_id,B.barang_kode,B.barang_nama,C.satuan_id,C.satuan_nama,A.jumlah_id,A.jumlah_jumlah,A.jumlah_detail from jumlah A join barang B on A.barang_id=B.barang_id join satuan C on A.satuan_id=C.satuan_id order by A.jumlah_id desc";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
n++;
String no=Integer.toString(n);
String[] value = {
no,
rs.getString("jumlah_id"),
rs.getString("barang_nama"),
rs.getString("satuan_id"),
rs.getString("satuan_nama"),
rs.getString("jumlah_jumlah"),
rs.getString("jumlah_detail"),
rs.getString("barang_id"),
};
 js.put(value);
}
json.put("aaData", js); 
/*
String x=js.toString();
String replace1=x.replace("{", "[");
String replace2=replace1.replace("}","]");
String replace3=replace2.replace(":",",");
        */
out.print(json);
%>
