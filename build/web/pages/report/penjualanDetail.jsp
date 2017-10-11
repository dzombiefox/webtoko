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
            <td colspan="4" style="text-align: center"><strong>Toko Lautan Samudra</strong></td>
        </tr>
         <tr>
            <td colspan="4" style="text-align: center">Laporan Detil Penjualan Barang</td>
        </tr>  <tr>
            <td colspan="4" style="text-align: center">Dari Tanggal : <% out.print(request.getParameter("tanggal1"));%> s/d Tanggal : <% out.print(request.getParameter("tanggal2"));%></td>
        </tr>
                  <tr>
                      <th>Tanggal</th>
                      <th>Nama Barang</th>
                      <th>Jumlah</th>
                      <th>Satuan</th>
                  </tr>
       <%
connect c=new connect();
String tanggal1=request.getParameter("tanggal1");
String tanggal2=request.getParameter("tanggal2");
String query="select distinct(k.keluar_tanggal)as tgl,d.*,s.satuan_nama, b.barang_nama from keluar k right  join detail d on k.keluar_kode=d.keluar_kode join barang b  on d.barang_id=b.barang_id join satuan s on d.satuan_id=s.satuan_id where keluar_tanggal between '"+tanggal1+"' and '"+tanggal2+"'";
ResultSet rs=c.GetData(query);
while(rs.next()){%>
  <tr>
      <td  align="center"><% out.print(rs.getString("tgl"));%> </td>
      <td  align="center"><% out.print(rs.getString("barang_nama"));%> </td>
       <td  align="center"><% out.print(rs.getString("detail_jumlah"));%> </td> 
      <td  align="center"><% out.print(rs.getString("satuan_nama"));%> </td>  
        
        </tr>
<%}
%>
       
              </table>
