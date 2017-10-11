

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
Date date = new Date();
String da=dateFormat.format(date);
    int n=0;
connect c=new connect();
String query="select m.masuk_referensi,m.masuk_id,m.masuk_tanggal,m.satuan_id,m.barang_id,m.masuk_jumlah,m.masuk_detailJumlah,m.masuk_keterangan,b.barang_nama,s.satuan_nama,k.suplier_nama from masuk m join barang b on m.barang_id=b.barang_id join satuan s on m.satuan_id=s.satuan_id join suplier k on m.suplier_id=k.suplier_id ";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
n++;
String no=Integer.toString(n);

String[] value = {

    rs.getString("masuk_id"),
rs.getString("masuk_tanggal"),    
rs.getString("masuk_referensi"), 
rs.getString("barang_id"),
rs.getString("barang_nama"),
rs.getString("satuan_id"),
rs.getString("masuk_jumlah"),
rs.getString("masuk_detailJumlah"),
rs.getString("satuan_nama"),



rs.getString("suplier_nama"),
rs.getString("masuk_keterangan")


};
 js.put(value);

 }
String x=js.toString();
String replace1=x.replace("{", "[");
String replace2=replace1.replace("}","]");
String replace3=replace2.replace(":",",");
out.print("{\"aaData\":"+replace3+"}");
%>