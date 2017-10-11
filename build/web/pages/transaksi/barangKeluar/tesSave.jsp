<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="config.connect"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
String tanggal=jsonObj.get("tanggal").toString();
String pembeli=jsonObj.get("pembeli").toString();
String totalBeli=jsonObj.get("totalBeli").toString();
String potongan=jsonObj.get("potongan").toString();
String bayar=jsonObj.get("bayar").toString();
String kembali=jsonObj.get("kembali").toString();
String row=jsonObj.get("row").toString();
String cekId="select isnull(max(keluar_id)+0,1) as id from keluar";
 ResultSet t=c.GetData(cekId);
 t.next();
String idnya=t.getString("id");
String exTanggal=tanggal.substring(2,4 );
String exBulan=tanggal.substring(5,7 );
String kode="SJ-"+exTanggal+exBulan+"-00"+idnya;
int rw=Integer.parseInt(row);
cs=con.prepareCall("call saveKeluar(?,?,?,?,?,?,?)");
    cs.setString(1, tanggal);
    cs.setString(2, pembeli);
    cs.setString(3, totalBeli);
    cs.setString(4, potongan);
    cs.setString(5, bayar);
    cs.setString(6, kembali);
    cs.setString(7, kode);    
    cs.execute();
  /* if(cs!=null){
    for(int i=0;i<=rw;i++){
JSONArray ar= (JSONArray) jsonObj.get("details");
JSONObject fr = (JSONObject) ar.get(i);
String barang=fr.get("barang").toString();
String satuan=fr.get("satuan").toString();
String jumlah=fr.get("jumlah").toString();
String harga=fr.get("harga").toString();
String total=fr.get("total").toString();
    
    }
    
    }
*/
%>