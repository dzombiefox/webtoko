<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
connect c =new connect();
String id=request.getParameter("id");
String query="select A.satuan_id ,B.satuan_nama from jumlah A join satuan B on A.satuan_id=B.satuan_id WHERE A.barang_id='"+id+"'" ;
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
 String[] value = {
rs.getString("satuan_id"),
rs.getString("satuan_nama")
};
 String[] key = {
"id",
"name"
}; 
 js.add(new pushData(key, value));
 }
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);
%>
