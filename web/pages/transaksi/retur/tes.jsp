<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
  Map m1 = new LinkedHashMap();
  Map m2 = new HashMap();
  List  l1 = new LinkedList();
String query="select * from barang";
ResultSet rs=c.GetData(query);
JSONArray js=new JSONArray();
while(rs.next()){
m1.put("id",rs.getString("barang_id"));
m1.put("nama",rs.getString("barang_nama"));
m1.put("kategory",rs.getString("kategori_id"));
l1.add(m1);

js.add(m1); 
}

String jsonString = JSONValue.toJSONString(js);
out.print("{\"aaData\":"+jsonString+"}");
%>