<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String kode=request.getParameter("kode");
String sb=request.getParameter("sb");
String sk=request.getParameter("sk");
String jumlah=request.getParameter("jumlah");
String skecil=request.getParameter("skecil");
String query="update jumlah set barang_id='"+kode+"',satuan_id='"+sb+"',satuan_besar='"+sb+"',jumlah_detail='"+skecil+"',jumlah_jumlah='"+jumlah+"' where jumlah_id='"+id+"'";
c.ManipulasiData(query);
String up="update tingkat set satuan_id='"+sb+"' where jumlah_id='"+id+"'";
c.ManipulasiData(up);
%>