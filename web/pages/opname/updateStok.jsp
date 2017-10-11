<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String saw=request.getParameter("saw");
String sak=request.getParameter("sak");
String ket=request.getParameter("ket");
String sat=request.getParameter("satuan");
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date(); 
String tanggal = dateFormat.format(date);
String query="insert into rstok(rstok_tanggal,barang_id,rstok_satuan,rstok_awal,rstok_akhir,rstok_keterangan)values('"+tanggal+"','"+id+"','"+sat+"','"+saw+"','"+sak+"','"+ket+"')";
c.ManipulasiData(query);
String qw="update stok set stok_jumlah='"+sak+"' where barang_id='"+id+"'";
c.ManipulasiData(qw);
%>
