<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String query="select A.keluar_kode,B.barang_id,B.barang_nama,C.satuan_id,C.satuan_nama,A.detail_jumlah,A.detail_harga,A.detail_total from  detail A join barang B on B.barang_id=A.barang_id join satuan C on A.satuan_id=C.satuan_id where A.keluar_kode='"+kode+"' ";
ResultSet rs=c.GetData(query);
JSONArray js=new JSONArray();
while(rs.next()){
  NumberFormat formatter = NumberFormat.getCurrencyInstance();
      Float hr=rs.getFloat("detail_harga");
      Float tt=rs.getFloat("detail_total");
      String harga = formatter.format(hr);
      String total= formatter.format(tt);
String[]value={
rs.getString("barang_id"),
rs.getString("barang_nama"),
rs.getString("satuan_id"),
rs.getString("satuan_nama"),
rs.getString("detail_jumlah"),
rs.getString("detail_harga"),
total
};
js.put(value);
}
String x=js.toString();
String replace1=x.replace("{", "[");
String replace2=replace1.replace("}","]");
String replace3=replace2.replace(":",",");
out.print("{\"aaData\":"+replace3+"}");
%>
