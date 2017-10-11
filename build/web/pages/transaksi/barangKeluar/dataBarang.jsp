<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONArray"%>
<%
    connect c=new connect();
    String query="select * from barang";
    ResultSet rs=c.GetData(query);
    JSONArray array=new JSONArray();
    while(rs.next()){
    JSONObject json=new JSONObject();
    json.put("id", rs.getString("barang_id"));
    json.put("kode", rs.getString("barang_kode"));
    json.put("nama", rs.getString("barang_nama"));
   // json.put("kategori", rs.getString("kategori_id"));
    array.add(json);
       }
    out.print(array);
%>