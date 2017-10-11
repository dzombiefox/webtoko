<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
    int n=0;
connect c =new connect();
String query="select * from barang join kategori on barang.kategori_id=kategori.kategori_id ORDER by barang_id desc";
ResultSet rs=c.GetData(query);
JSONObject json=new JSONObject();
JSONArray js = new JSONArray();
while(rs.next()){
n++;
String no=Integer.toString(n);
String[] value = {
no,
rs.getString("barang_kode"),
rs.getString("barang_nama"),
rs.getString("kategori_nama")
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json);
%>
