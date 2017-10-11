<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
int n=0;
connect c=new connect();
String query="select h.harga_id,h.harga_harga,h.harga_beli,b.barang_kode,b.barang_nama,s.satuan_nama from harga h join barang b on h.barang_id=b.barang_id join satuan s on h.satuan_id=s.satuan_id order by harga_id desc";
ResultSet rs=c.GetData(query);
JSONObject json=new JSONObject();
JSONArray js = new JSONArray();
while(rs.next()){
n++;
String no=Integer.toString(n);

Float  ct=rs.getFloat("harga_harga");
Float  cb=rs.getFloat("harga_beli");
   NumberFormat nf = NumberFormat.getInstance();
		//nf.setMinimumFractionDigits(2);   // ignore this if you don't care about limiting to 2 decimal places
		//nf.setMaximumFractionDigits(2);  // ignore this if you don't care about limiting to 2 decimal places
    String rp="Rp ";	
    String mt =rp+nf.format(ct);
    String mb =rp+nf.format(cb);
String[] value = {
no,
rs.getString("harga_id"),
rs.getString("barang_nama"),
rs.getString("satuan_nama"),
mb,
mt,
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