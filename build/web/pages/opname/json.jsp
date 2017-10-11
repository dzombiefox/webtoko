<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="config.connect"%>
<%
    int n=0;
connect c=new connect();
JSONArray js=new JSONArray();
String query="select distinct(a.barang_id),a.stok_jumlah,b.jumlah_detail,c.barang_kode,c.barang_nama,d.kategori_nama from stok a right join jumlah b on a.barang_id=b.barang_id join barang c on a.barang_id=c.barang_id join kategori d on c.kategori_id=d.kategori_id";
ResultSet rs=c.GetData(query);
while(rs.next()){
n++;
String no=Integer.toString(n);
    String[]value={
        no,
        rs.getString("barang_id"),
        rs.getString("barang_kode"), 
        rs.getString("barang_nama"),  
        rs.getString("kategori_nama"),
        rs.getString("stok_jumlah"),
        rs.getString("jumlah_detail"),
       };
    js.put(value);
}
String x=js.toString();
String replace1=x.replace("{", "[");
String replace2=replace1.replace("}","]");
String replace3=replace2.replace(":",",");
out.print("{\"aaData\":"+replace3+"}");


%>