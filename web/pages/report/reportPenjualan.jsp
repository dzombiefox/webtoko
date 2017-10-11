<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
  
        <html>
            <head>
<style>
    html {
    overflow: -moz-scrollbars-vertical;
}
    *{
        font-size: 12px;
    }
    #printing{
        width: 370px;
        margin:auto;
        font-family: sans-serif;
        padding-top: 20px;
        padding-bottom: 20px;        
        //border: 1px dashed #008287;        
    }
    
</style>
            </head>
<body>
     <table   align="center">
        <tr >
            <td colspan="4" style="text-align: center"><strong>Toko Lautan Samudra</strong></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">Laporan Penjualan Barang</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">Dari Tanggal : <% out.print(request.getParameter("tanggal1"));%> s/d Tanggal : <% out.print(request.getParameter("tanggal2"));%></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">*************************************************************</td>
        </tr>
     </table>
    <%
        connect c=new connect();
String tanggal1=request.getParameter("tanggal1");
String tanggal2=request.getParameter("tanggal2");
String query="select * from keluar where keluar_tanggal between '"+tanggal1+"' and '"+tanggal2+"'";
ResultSet rs=c.GetData(query);
while(rs.next()){
String tanggal=rs.getString("keluar_tanggal");
String pembeli=rs.getString("keluar_pembeli");
String kode=rs.getString("keluar_kode");
Float total=rs.getFloat("keluar_total");
 NumberFormat formatter = NumberFormat.getInstance();
 
Float potongan=rs.getFloat("keluar_potongan");
Float bayar=rs.getFloat("keluar_bayar");
Float kembali=rs.getFloat("keluar_kembali");
String kom=",00";
 String ktotal = formatter.format(total)+kom;
 String kpotongan = formatter.format(potongan)+kom;
 String kbayar = formatter.format(bayar)+kom;
 String kkembali = formatter.format(kembali)+kom;
        %>
        
<div id="printing">
    
    <table   align="center">
       
         <tr>
             <td colspan="4" align="center">Tanggal : <%=tanggal%></td>
        
          
        </tr>
         <tr>
            <td colspan="4" align="center">No Faktur : <%=kode%></td>
           
          
        </tr>
        <tr>
            <td colspan="4" align="center">Pembeli : <%=pembeli%></td>
          
          
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">==============================================</td>
        </tr>
        <tr>
            <td>Produk</td>
            <td>Jumlah</td>
            <td align="right">Harga</td>
            <td align="right">Sub Total</td>
        </tr>
        
      <%
      String detail="select a.detail_harga,a.detail_total,a.detail_jumlah,a.detail_total,b.barang_nama,c.satuan_nama from detail a join barang b on a.barang_id=b.barang_id join satuan c on c.satuan_id=a.satuan_id where a.keluar_kode='"+kode+"'";
      ResultSet r=c.GetData(detail);
      while(r.next()){
          String koma=",00";
String nama=r.getString("barang_nama");
String satuan=r.getString("satuan_nama");
String jumlah=r.getString("detail_jumlah");
Float pharga=r.getFloat("detail_harga");
String harga=formatter.format(pharga)+koma;
Float pTotal=r.getFloat("detail_total");
String totalHarga=formatter.format(pTotal)+koma;
String spasi=" ";
      %>
      <tr>
      <td><%=nama %></td>
       <td ><%=jumlah +spasi+satuan%></td>
       <td align="right"><% out.print(harga); %></td>
        <td align="right"><% out.print(totalHarga); %></td>
		 <td align="right"><% out.print(totalHarga); %></td>
      </tr>
     <% }
      
      %>
      <tr>
            <td colspan="4" style="text-align: center">==============================================</td>
        </tr>
           <tr>
            <td></td>
            <td>Total</td>
            <td>:</td>
            <td align="right"><% out.print(ktotal);%></td>
        </tr>
        <tr>
            <td></td>
            <td>Potongan</td>
            <td>:</td>
            <td align="right"><% out.print(kpotongan);%></td>
        </tr>
        <tr>
            <td></td>
            <td>Bayar</td>
            <td>:</td>
            <td align="right"><% out.print(kbayar);%></td>
        </tr>
         <tr>
            <td></td>
            <td>Kembali</td>
            <td>:</td>
            <td align="right"><%out.print(kkembali);%></td>
        </tr>
          
       
    </table>
    
       
</div><br>
            <% }%>
</body>
        </html>