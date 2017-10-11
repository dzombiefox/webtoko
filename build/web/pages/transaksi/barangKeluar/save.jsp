<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="config.connect"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%
    
connect c=new connect();
String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
String tanggal=jsonObj.get("tanggal").toString();
String pembeli=jsonObj.get("pembeli").toString();
String totalBeli=jsonObj.get("totalBeli").toString();
String potongan=jsonObj.get("potongan").toString();
String bayar=jsonObj.get("bayar").toString();
String kembali=jsonObj.get("kembali").toString();
String cekId="select isnull(max(keluar_id)+0,0) as id from keluar";
ResultSet t=c.GetData(cekId);
    t.next();
    String idnya=t.getString("id");
String exTanggal=tanggal.substring(2,4 );
String exBulan=tanggal.substring(5,7 );
int x=Integer.parseInt(idnya)+1;
String kode="SL-"+exTanggal+exBulan+"-00"+x;
String row=jsonObj.get("row").toString();
int rw=Integer.parseInt(row);
String query="insert into keluar(keluar_tanggal,keluar_pembeli,keluar_kode,keluar_total,keluar_potongan,keluar_bayar,keluar_kembali)values('"+tanggal+"','"+pembeli+"','"+kode+"','"+totalBeli+"','"+potongan+"','"+bayar+"','"+kembali+"')";
c.ManipulasiData(query);
for(int i=0;i<=rw;i++){
   // out.print("kampret");
JSONArray ar= (JSONArray) jsonObj.get("details");
JSONObject fr = (JSONObject) ar.get(i);
String barang=fr.get("barang").toString();
String satuan=fr.get("satuan").toString();
String jumlah=fr.get("jumlah").toString();
String harga=fr.get("harga").toString();
String total=fr.get("total").toString();
String cekJumlah=" select jumlah_jumlah from jumlah where barang_id='"+barang+"' and satuan_id='"+satuan+"' ";
ResultSet rs=c.GetData(cekJumlah);
rs.next();
int jml=rs.getInt("jumlah_jumlah");
int jum=Integer.parseInt(jumlah);
int totalKurang=jml*jum; 
String cekStok="select stok_jumlah from stok where barang_id='"+barang+"'";
ResultSet r=c.GetData(cekStok);
r.next();
int stok=r.getInt("stok_jumlah");
int totalStok=stok-totalKurang;
String updateStok="update stok set stok_jumlah='"+totalStok+"' where barang_id='"+barang+"'";
c.ManipulasiData(updateStok);
String qu="insert into detail(keluar_kode,barang_id,satuan_id,detail_jumlah,detail_harga,detail_total)values('"+kode+"','"+barang+"','"+satuan+"','"+jumlah+"','"+harga+"','"+total+"')";
c.ManipulasiData(qu);
}
out.print("tes");

%>