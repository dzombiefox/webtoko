<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String tanggal = dateFormat.format(date);
String idNya=request.getParameter("idNya");

String idSatuan=request.getParameter("idSatuan");
String jumlah=request.getParameter("jumlah");
String rsatuan=request.getParameter("rsatuan");
String rjumlah=request.getParameter("rjumlah");
int rjum=Integer.parseInt(rjumlah);
String kembali=request.getParameter("kembali");
String keterangan=request.getParameter("keterangan");
String kjual=request.getParameter("kjual");
String pilihan=request.getParameter("pilihan");
int pil=Integer.parseInt(pilihan);
String cek="select jumlah_jumlah from jumlah where barang_id='"+idNya+"' and satuan_id='"+rsatuan+"' ";
ResultSet rs=c.GetData(cek);
rs.next();
int jum=rs.getInt("jumlah_jumlah");
int kali=jum*rjum; //total stok untuk di kembalikan ke table stok
out.print(idNya);
String cekStok="select stok_jumlah from stok where barang_id='"+idNya+"' ";
ResultSet rstok=c.GetData(cekStok);
rstok.next();
int tStok=rstok.getInt("stok_jumlah");
int sisaStok=tStok+kali;

if(pil==1){
String query="insert into retur(retur_tanggal,keluar_kode,barang_id,satuan_id,jumlah,retur_uang,retur_pilihan,keterangan)values('"+tanggal+"','"+kjual+"','"+idNya+"','"+rsatuan+"','"+rjumlah+"','"+kembali+"','"+pil+"','"+keterangan+"')";
c.ManipulasiData(query);
String updateStok="update stok set stok_jumlah='"+sisaStok+"' where barang_id='"+idNya+"'";
c.ManipulasiData(updateStok);
}
else{
String query="insert into retur(retur_tanggal,keluar_kode,barang_id,satuan_id,jumlah,retur_uang,retur_pilihan,keterangan)values('"+tanggal+"','"+kjual+"','"+idNya+"','"+rsatuan+"','"+rjumlah+"','"+kembali+"','"+pil+"','"+keterangan+"')";
c.ManipulasiData(query);

}
     
%>