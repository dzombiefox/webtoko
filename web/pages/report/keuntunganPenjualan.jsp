<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script>
    function batasiAngka(angka,digit){
    return angka.toFixed(digit);
    }
    $(document).ready(function(){
      var table= $("#example").dataTable({
             "footerCallback": function ( row, data, start, end, display ) {
			var api = this.api(), data;
                        var intVal = function ( i ) {
			return typeof i === 'string' ?
			i.replace(/[\$,]/g, '')*1 :
			typeof i === 'number' ?
			i : 0;
			};
// Total over all pages
			data = api.column( 6 ).data();
			total = data.length ?
				data.reduce( function (a, b) {
				return intVal(a) + intVal(b);
				} ) :
				0;
			// Total over this page
			data = api.column( 8, { page: 'current'} ).data();
			pageTotal = data.length ?
				data.reduce( function (a, b) {
						return batasiAngka(intVal(a) + intVal(b),2);
				} ) :
				0;
			// Update footer
			$( api.column( 8 ).footer() ).html(
				pageTotal
			);
            
		}   
            
        }); table.fnSort( [[1,"asc"]]);
        
    });
</script>
 <h3>
                    <a href="#"><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
               Laporan Keuntungan Penjualan Barang
                </h3>
<div class="example">
<table class="table  bordered" id="example">      
    <thead>
    <th>No</th>
    <th>Tanggal</th>
    <th>Kode Penjualan</th>
    <th>Nama Barang</th>
     <th>Jumlah </th>
      <th>Satuan</th>
       <th>Harga Pokok</th>
        <th>Harga Jual</th>
         <th >Profit</th>
    </thead>
    <tbody>
    <%
        int no=0;
        connect c=new connect();
String tanggal1=request.getParameter("tanggal1");
String tanggal2=request.getParameter("tanggal2");
String query="select k.keluar_tanggal,b.barang_nama,d.keluar_kode,d.detail_harga,d.detail_jumlah,m.barang_id, m.satuan_id,s.satuan_nama, sum(masuk_jumlah * masuk_harga) / sum(masuk_jumlah) as totalHargaAvg, (detail_harga - sum(masuk_jumlah * masuk_harga) / sum(masuk_jumlah)) as keuntungan from detail d join barang b on d.barang_id=b.barang_id join satuan s on d.satuan_id=s.satuan_id join masuk m on m.barang_id = d.barang_id join keluar k on k.keluar_kode=d.keluar_kode where k.keluar_tanggal between '"+tanggal1+"' and '"+tanggal2+"'  group by m.barang_id, m.satuan_id ,d.keluar_kode,d.detail_harga,d.detail_jumlah,b.barang_nama,s.satuan_nama,k.keluar_tanggal";
ResultSet rs=c.GetData(query);
while(rs.next()){
    no++;
    String tanggal=rs.getString("keluar_tanggal");
String kode=rs.getString("keluar_kode");
String bnama=rs.getString("barang_nama");
String jumlah=rs.getString("detail_jumlah");
String satuan=rs.getString("satuan_nama");
float hpokok=rs.getFloat("totalHargaAvg");
float bjual=rs.getFloat("detail_harga");
float selisih=rs.getFloat("keuntungan");   
NumberFormat formatter = NumberFormat.getInstance();
    String rp="Rp ";
    String koma=",00";
    String hpok = formatter.format(hpokok);
    String bju = formatter.format(bjual);
    String profit = formatter.format(selisih);
    %>
         <tr>
             <td><%=no%></td>
             <td><%=tanggal%></td> 
            <td><%=kode%></td>           
            <td><%=bnama%></td>
             <td><%=jumlah%></td>
            <td><%=satuan%></td>           
            <td align="right"><%=hpok%></td>
            <td align="right"><%=bju%></td>           
            <td align="right"><%=selisih%></td>
        </tr>
       
         <% }%>
    </tbody>
        <tfoot>
					<tr>
						<th colspan="8" style="text-align:right">Total Keuntungan:</th>
						<th></th>
					</tr>
				</tfoot>
     </table>
    </table>
    
       

          
</div>