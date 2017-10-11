<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<script type="text/javascript">    
        $(document).ready(function () {
        var table = $('#example').DataTable({ "columnDefs": [ 
			{
				"targets": [ 0 ],
				"visible": false,
				"searchable": true
			},
            {
				"targets": [ 2 ],
				"visible": false,
				"searchable": true
			}        
            ],
            "bPaginate":false,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": false,
            "bInfo": false,
    "footerCallback": function ( row, data, start, end, display ) {
			var api = this.api(), data;

			// Remove the formatting to get integer data for summation
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
			data = api.column( 6, { page: 'current'} ).data();
			pageTotal = data.length ?
				data.reduce( function (a, b) {
						return intVal(a) + intVal(b);
				} ) :
				0;

			// Update footer
			$( api.column( 6 ).footer() ).html(
				pageTotal
			);
		}    
    });

	$('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	} );

	$('#button').click( function () {
		table.row('.selected').remove().draw( false );
	} );
        	     
    });
     function add() {
        var barang= $("#barang").val();
        var satuan = $("#satuan").val();
        var jumlah = $("#jumlah").val();
        var harga = $("#harga").val();
        var total=$("#total").val();
        var namaBarang=$('select[name=barang] option:selected').text();
        var namaSatuan=$('select[name=satuan] option:selected').text();
        $("#example").dataTable().fnAddData([barang,namaBarang,satuan,namaSatuan, jumlah,harga,total]); 
        $("#barang").val("");
        $("#satuan").val("");
        $("#jumlah").val("");
        $("#harga").val("");
         $("#total").val("");
        }    

 </script>
    
 <br>
   
 <div class="example">
     <div  class="span4">
         <div class="input-control text">
         <input type="text" value="" placeholder="kode Beli" id="kode"/>
    <button class="btn-clear"></button>
    </div>
            
            
             <div class="input-control text" data-role="datepicker" data-date="2014-11-13" data-format="yyyy-m-d" data-effect="slide" data-other-days="1">
                      <input type="text" id="tanggal">
                                    <button class="btn-date"></button>
                                </div>
        
             <div class="input-control text">
        <input type="text" value="" placeholder="Pembeli" id="pembeli"/>
    <button class="btn-clear"></button>
    </div>
 </div>
    
     <table class="table">
              <tr>
                  <td><div class="input-control select" > 
                          <select id="barang" name="barang">
                              <option selected="selected">.:Pilih:.</option>
<%
connect c=new connect();
String query="select * from barang";
ResultSet rs=c.GetData(query);
while(rs.next()){
out.print("<option value='"+rs.getString("barang_id")+"'>"+rs.getString("barang_nama")+"</option>");
}
%>
                     </select></div></td>
                     <td><div class="input-control select">
                     <select id="satuan"  name="satuan">

                     </select></div></td>
                     <td><div class="input-control text "><input type="text" placeholder="harga" id="harga" readonly="readonly"></div></td>
<td><div class="input-control text "><input type="text" placeholder="jumlah" id="jumlah"></div></td>
<td><div class="input-control text "><input type="text" placeholder="total" id="total" readonly></div></td>
<td><img src="./images/cek.ico" onclick="add()" title="choose"></td>   
         </tr>
     </table>

     <table id="example" class="table bordered" >
    <thead>
        <tr>
            <th>Barang ID</th>
            <th>Barang</th>
            <th>Satuan ID</th>
            <th>Satuan</th>
            <th>Jumlah</th>
             <th>Harga</th>
             <th>Total</th>
        </tr>
    </thead>
    <tbody>
        
        	<tr>
						<td>Tiger Nixon</td>
						<td>System Architect</td>
						<td>Edinburgh</td>
						<td>61</td>
						<td>2011/04/25</td>
						<td>$320,800</td>
                                                <td>$320,800</td>
					</tr>
        
    </tbody>
     <tfoot>
					<tr>
						<th colspan="6" style="text-align:right">Total:</th>
						<th></th>
					</tr>
				</tfoot>
</table>
                                   
 <input type="button" value="save" onclick="save()" class="primary"/>
 
 <input type="button" value="delete Row" class="button default" id="button" />
  <div id="notiv"></div>
       </div>
                     
                     
                     