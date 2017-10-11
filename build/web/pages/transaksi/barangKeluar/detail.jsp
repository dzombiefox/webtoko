<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<script type="text/javascript">
    $(document).ready(function(){
        $("#close").click(function(){
            $("#remove").removeAttr("disabled");
            $("#detailPage").html("");
         });
         $("#retur").click(function(){
             
             
         });
         
         var table2 = $('#example2').DataTable({
             "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			}],
	    "bPaginate":false,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": false,
            "bInfo": false,
			
               });
         
        
    });
    
</script>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String qe="select * from keluar where keluar_kode='"+kode+"'";
ResultSet r=c.GetData(qe);
r.next();
%>
<br>
 <div class="example">
  
  
     
     
     <h3>
                    <a href="#"><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
               Detail Penjualan Barang
                </h3>

         <div style="float:right">
             <a class="button success"><% out.print(kode); %></a>
             <button class="button info" id="close">Tutup</button></div>
    <br>
    <br>
    <table class="table bordered" id="example2">
    <thead>
    <tr>
    <th>No</th>
    <th>Kode Barang</th>
    <th>Nama Barang</th>
    <th>Satuan</th>
    <th>Jumlah</th>
    <th>Harga</th>
    <th>Total</th>
    </tr>
    </thead>
    <tbody>
      <%
int no=1;
String query="select A.keluar_kode,B.barang_id,B.barang_nama,C.satuan_nama,A.detail_jumlah,A.detail_harga,A.detail_total from  detail A join barang B on B.barang_id=A.barang_id join satuan C on A.satuan_id=C.satuan_id where A.keluar_kode='"+kode+"'";
ResultSet rs=c.GetData(query);
while(rs.next()){
    String rp="Rp ";
    String koma=",00";
      NumberFormat formatter = NumberFormat.getInstance();
      Float hr=rs.getFloat("detail_harga");
      Float tt=rs.getFloat("detail_total");
      String harga = rp+formatter.format(hr)+koma;
      String total= rp+formatter.format(tt)+koma;
      
      %>
<tr>
    <td><% out.print(no);%></td>
    <td><% out.print(rs.getString("barang_id"));%></td>
    <td><% out.print(rs.getString("barang_nama"));%></td>
    <td><% out.print(rs.getString("satuan_nama"));%></td>
    <td><% out.print(rs.getString("detail_jumlah"));%></td>
    <td><% out.print(harga);%></td>
    <td><% out.print(total);%></td>
</tr>
<% no++;}
%>
        
    </tbody>
    
</table>

 </div>
