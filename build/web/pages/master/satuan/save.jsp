<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String kode=request.getParameter("kode");
String sb=request.getParameter("sb");
String sk=request.getParameter("sk");
String skecil=request.getParameter("skecil");
String jumlah=request.getParameter("jumlah");
cs=con.prepareCall("call saveJumlah(?,?,?,?,?)");
    cs.setString(1, kode);
    cs.setString(2, sb);
    cs.setString(3, sk);
    cs.setString(4, skecil);
    cs.setString(5, jumlah);
    cs.execute();
    
%>