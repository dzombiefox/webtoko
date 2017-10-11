<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String query="select * from keluar order by keluar_id desc ";
ResultSet rs=c.GetData(query);
JSONArray js=new JSONArray();
while(rs.next()){
Float  kt=rs.getFloat("keluar_total");
Float  kb=rs.getFloat("keluar_bayar");
Float  kk=rs.getFloat("keluar_kembali");
Float  kp=rs.getFloat("keluar_potongan");
    NumberFormat formatter = NumberFormat.getInstance();
    String rp="Rp ";
    String koma=",00";
    String ktotal = rp+formatter.format(kt)+koma;
    String kbayar =rp+formatter.format(kb)+koma;
    String kkembali = rp+formatter.format(kk)+koma;
    String kpotongan = rp+formatter.format(kp)+koma;
String[]value={
rs.getString("keluar_kode"),
rs.getString("keluar_tanggal"),
rs.getString("keluar_pembeli"),
ktotal,
kpotongan,
kbayar,
kkembali
};
js.put(value);
}
String x=js.toString();
String replace1=x.replace("{", "[");
String replace2=replace1.replace("}","]");
String replace3=replace2.replace(":",",");
out.print("{\"aaData\":"+replace3+"}");
%>
