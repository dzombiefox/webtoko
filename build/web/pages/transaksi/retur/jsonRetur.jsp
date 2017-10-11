<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String query="select r.retur_tanggal,r.keluar_kode,r.jumlah,r.retur_uang,r.retur_pilihan,r.keterangan,b.barang_nama,s.satuan_nama from retur r join barang b on r.barang_id=b.barang_id join satuan s on s.satuan_id=r.satuan_id ";
ResultSet rs=c.GetData(query);
JSONArray js=new JSONArray();
while(rs.next()){
    NumberFormat formatter = NumberFormat.getInstance();
       Float  ru=rs.getFloat("retur_uang");
       String rp="Rp ";
       String koma=",00";
       String rtotal = rp+formatter.format(ru)+koma;
    String ok;
    int pilihan=rs.getInt("retur_pilihan");
    if(pilihan==1){
    ok="Barang masuk ke stok";
    }
    else{
    ok="Barang di musnahkan";
    }
 String[]value={
rs.getString("retur_tanggal"),
rs.getString("keluar_kode"),
rs.getString("barang_nama"),
rs.getString("jumlah"),
rs.getString("satuan_nama"),
rtotal,
ok,
rs.getString("keterangan")
};
js.put(value);
}
String x=js.toString();
String replace1=x.replace("{", "[");
String replace2=replace1.replace("}","]");
String replace3=replace2.replace(":",",");
out.print("{\"aaData\":"+replace3+"}");
%>

