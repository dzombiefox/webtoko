<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
  <%
        connect c=new connect();
      
        String q="select top 1 * from keluar  order by keluar_id desc";
        ResultSet rs=c.GetData(q);
        rs.next();
        String tgl=rs.getString("keluar_tanggal");
        String kd=rs.getString("keluar_kode");
        String pb=rs.getString("keluar_pembeli");
       Float kt=rs.getFloat("keluar_total");
       Float pt=rs.getFloat("keluar_potongan");
       Float by=rs.getFloat("keluar_bayar");
       Float kbl=rs.getFloat("keluar_kembali");
        NumberFormat formatter = NumberFormat.getCurrencyInstance();
        String ktotal = formatter.format(kt);
        String ptotal = formatter.format(pt);
        String pbayar = formatter.format(by);
        String pkembali = formatter.format(kbl);
        %>
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
        
      //  border: 1px dashed #008287;
        
    }
    
</style>
            </head>
<body>
<div id="printing">
    <table   align="center" >
        <tr >
            <td colspan="4" style="text-align: center"><strong>Toko Lautan Samudra</strong></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">Jalan : Jendral Sudirman Ciawi Bogor</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">Telp/Faks.0909090909</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">------------------------------------------------------------------------------------</td>
        </tr>
        <tr>
            <td>No Faktur</td>
            
            <td >: <%=kd%></td>
            <td>Tanggal</td>
            <td>: <%=tgl%></td>
        </tr>
        <tr>
            <td>Pembeli</td>
          
            <td >: <%=pb%></td>
            <td>Jam</td>
            <td>: <%
            DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
Date date = new Date();
out.print(dateFormat.format(date));
            %></td>
        </tr>
        <tr>
            <td>Kasir</td>
            <td>: <% 
 
       out.print(session.getAttribute("level"));
    %></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">------------------------------------------------------------------------------------</td>
        </tr>
      
        
      <%
      String detail="select detail.*,barang.barang_nama,satuan.satuan_nama from detail  join barang on detail.barang_id=barang.barang_id join satuan on detail.satuan_id=satuan.satuan_id where detail.keluar_kode='"+kd+"'";
      ResultSet rst=c.GetData(detail);
      while(rst.next()){
      String barang=rst.getString("barang_nama");
      String jumlah=rst.getString("detail_jumlah");
      Float harga=rst.getFloat("detail_harga");
      Float total=rst.getFloat("detail_total");      
      String kharga = formatter.format(harga);
      String satuan=rst.getString("satuan_nama");
      String spasi=" ";
      String ktot = formatter.format(total);
      %>
      <tr>
          <td><%=jumlah +spasi+satuan%></td>
      <td><%=barang %></td>
       
       <td align="right"><% out.print(kharga.substring(2)); %>&nbsp;&nbsp;&nbsp;=</td>
        <td align="right"><% out.print(ktot.substring(2)); %></td>
      </tr>
     <% }
      
      %>
      <tr>
            <td colspan="4" style="text-align: center">------------------------------------------------------------------------------------</td>
        </tr>
           <tr>
            <td></td>
            <td>Total</td>
            <td>:</td>
            <td align="right"><% out.print(ktotal.substring(2));%></td>
        </tr>
        <tr>
            <td></td>
            <td>Potongan</td>
            <td>:</td>
            <td align="right"><% out.print(ptotal.substring(2));%></td>
        </tr>
        <tr>
            <td></td>
            <td>Bayar</td>
            <td>:</td>
            <td align="right"><% out.print(pbayar.substring(2));%></td>
        </tr>
         <tr>
            <td></td>
            <td>Kembali</td>
            <td>:</td>
            <td align="right"><%out.print(pkembali.substring(2));%></td>
        </tr>
           <tr>
           <td colspan="4" style="text-align: center">------------------------------------------------------------------------------------</td>
        </tr>
         <tr>
             <td colspan="4" align="center">Terima Kasih atas kunjungan anda</td>          
        </tr>
        
    </table>
        

</div>
</body>
        </html>