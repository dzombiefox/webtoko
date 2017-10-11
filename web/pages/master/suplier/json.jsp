<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="config.connect"%>
<%
    int n=0;
connect c=new connect();
JSONObject json=new JSONObject();
JSONArray js=new JSONArray();
String query="select * from suplier";
ResultSet rs=c.GetData(query);
while(rs.next()){
    n++;
    String no=Integer.toString(n);
    String []value={
    no,rs.getString("suplier_id"),
    rs.getString("suplier_nama"),    
    rs.getString("suplier_noTelp"),
    rs.getString("suplier_fax"),
    rs.getString("suplier_alamat"),
    };
    js.put(value);
}
/*
String x=js.toString();

String replace1=x.replace("{", "[");
String replace2=replace1.replace("}","]");
String replace3=replace2.replace(":",",");
       
out.print("{\"aaData\":"+replace3+"}");
        */
json.put("aaData", js);
out.print(json);
%>