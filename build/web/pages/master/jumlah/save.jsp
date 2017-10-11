<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String sb=request.getParameter("sb");
String sk=request.getParameter("sk");
String skecil=request.getParameter("skecil");
String jumlah=request.getParameter("jumlah");
String query="insert into detailJumlah(barang_id,satuan_id,detailJumlah_satuanKecil,detailJumlah_satuanDetail,detailJumlah_jumlah)values('"+kode+"','"+sb+"','"+sk+"','"+skecil+"','"+jumlah+"')";
c.ManipulasiData(query);
%>