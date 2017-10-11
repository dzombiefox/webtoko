<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
int n=0;
connect c=new connect();
String query="select  * from admin where id !=1";
ResultSet rs=c.GetData(query);
JSONObject json=new JSONObject();
JSONArray js = new JSONArray();
while(rs.next()){
n++;
String no=Integer.toString(n);
String[] value = {
no,
rs.getString("id"),
rs.getString("nama"),
rs.getString("username"),
rs.getString("lev")

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
