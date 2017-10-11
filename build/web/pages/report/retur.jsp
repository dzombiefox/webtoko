<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<style>
   table { 
		width: 100%; 
		border-collapse: collapse; 
                font-family: tahoma;
                font-size: 10px;
	}
	
/* Zebra striping */
	tr:nth-of-type(odd) { 
		background: #eee; 
	}
	
th { 
		background: #333; 
		color: white; 
		font-weight: bold; 
	}

	td, th { 
		padding: 6px; 
		border: 1px solid #ccc; 
		text-align: left; 
	}
</style>
 
              <table  align="center" >
                  <tr >
            <td colspan="8" style="text-align: center"><strong>Toko Lautan Samudra</strong></td>
        </tr>
         <tr>
            <td colspan="8" style="text-align: center">Laporan Barang Retur</td>
        </tr>  <tr>
            <td colspan="8" style="text-align: center">Dari Tanggal : <% out.print(request.getParameter("tanggal1"));%> s/d Tanggal : <% out.print(request.getParameter("tanggal2"));%></td>
        </tr>
                  <tr>
                      <th>Tanggal</th>
                      <th>Kode Penjualan</th>
                      <th>Nama Barang</th>
                      <th>Jumlah</th>
                      <th>Satuan</th>
                      <th>Uang kembali</th>
                      <th>Pilihan</th>
                      <th>Keterangan</th>
                  </tr>
       <%
connect c=new connect();
String tanggal1=request.getParameter("tanggal1");
String tanggal2=request.getParameter("tanggal2");
String query="select r.retur_tanggal,r.keluar_kode,r.jumlah,r.retur_uang,r.retur_pilihan,r.keterangan,b.barang_nama,s.satuan_nama from retur r join barang b on r.barang_id=b.barang_id join satuan s on s.satuan_id=r.satuan_id where retur_tanggal between '"+tanggal1+"' and '"+tanggal2+"'";
ResultSet rs=c.GetData(query);
while(rs.next()){
       NumberFormat formatter = NumberFormat.getInstance();
       Float  ru=rs.getFloat("retur_uang");
       String rp="Rp ";
       String koma=",00";
       String rtotal = rp+formatter.format(ru)+koma;
       String ok;
    int pilihan=rs.getInt("retur_pilihan");
    if(pilihan==1){
    ok="Barang masuk ke stok";
    }
    else{
    ok="Barang di musnahkan";
    }
       %>
  <tr>
      <td  align="center"><% out.print(rs.getString("retur_tanggal"));%> </td>
       <td  align="center"><% out.print(rs.getString("keluar_kode"));%> </td>
      <td  align="center"><% out.print(rs.getString("barang_nama"));%> </td>
       <td  align="center"><% out.print(rs.getString("jumlah"));%> </td> 
      <td  align="center"><% out.print(rs.getString("satuan_nama"));%> </td>  
        <td  align="center"><%=rtotal %> </td>
        <td  align="center"><%=ok %> </td>
         <td  align="center"><% out.print(rs.getString("keterangan"));%> </td>  
        </tr>
<%}
%>
       
              </table>
