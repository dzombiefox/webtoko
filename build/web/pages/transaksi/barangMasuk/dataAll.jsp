                     <%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script type="text/javascript">  
    
function totalHarga(){
    var harga=$("#harga").val();
    var jumlah=$("#jumlah").val();
    var total=harga*jumlah;
    $("#total").val(total);
    
}
    $(function(){
        $('.open-dialog').click(function() {
		$('#kotak-dialog').show();
		$('#dialog-overlay').fadeTo("normal", 0.4);
                return false;
	});
	$('#kotak-dialog .close').click(function() {
           	$('#dialog-overlay, #kotak-dialog').hide();      
                $("#tanggal").val("");
                  $("#ref").val("");
		return false;
	});
    });    
    $(document).ready(function(){   
        $('#jumlah').change(function(){
					console.log('Second change event...');
				});
				
	$('#jumlah').number( true ); 
        $("#kode").change(function(){
            var kode=$("#kode").val();
            $.ajax({
                url:"transaksi/barangMasuk/cekSatuan.jsp",
                data:"kode="+kode,
                success:function(data){
                    $("#satuan").html(data);                    
                }              
                });
            });
       
    $("#remove").attr("disabled","disabled");
    
        var id="";
        var idBrg="";
        var satuan="";
        var jumlah="";
        var ref="";
        var suplier="";
        $("#save").click(function(){
           var tanggal=$("#tanggal").val(); 
           var kode=$("#kode").val();
           var satuan=$("#satuan").val();
           var jumlah=$("#jumlah").val();
           //var harga=$("#harga").val();
          // var total=$("#total").val();
           var keterangan=$("#keterangan").val();
           var ref=$("#ref").val();
           var suplier=$("#suplier").val();
           if(tanggal==""){
               alert("tanggal tidak boleh kosong");
               $("#tanggal").focus();
           }
           else if(ref==""){
               alert("No Referensi tidak boleh kosong");
               $("#ref").focus();
           }
          // else if(harga==""){
            //   alert("Harga tidak boleh kosong");
              // $("#harga").focus();
           //}
           else if(jumlah==""){
               alert("Jumlah barang tidak boleh kosong");
               $("#jumlah").focus();
           }
           else{
          $.ajax({
              url:"transaksi/barangMasuk/cekHarga.jsp",
              data:"kode="+kode+"&satuan="+satuan,
              success:function(data){
                   var hasil=parseInt(data);
                    if(hasil==1){
                        
                        alert("Harga Belum Diinput !!");
                    }
                    else{
                       $.ajax({
                           
                            url:"transaksi/barangMasuk/save.jsp",
              data:"&tanggal="+tanggal+"&kode="+kode+"&satuan="+satuan+"&jumlah="+jumlah+"&keterangan="+keterangan+"&ref="+ref+"&suplier="+suplier,
              success:function(data){
                  $("#kode").val("");
                  $("#satuan").val("");
                  $("#jumlah").val("");
                  
                  $("#suplier").val("");
                  $("#keterangan").val("");
                  RefreshTable("#example","transaksi/barangMasuk/jsonAll.jsp");            
              } 
                       });
                    }
              }
                /*
              url:"transaksi/barangMasuk/save.jsp",
              data:"&tanggal="+tanggal+"&kode="+kode+"&satuan="+satuan+"&jumlah="+jumlah+"&keterangan="+keterangan+"&ref="+ref+"&suplier="+suplier,
              success:function(data){
                  $("#kode").val("");
                  $("#satuan").val("");
                  $("#jumlah").val("");
                  
                  $("#suplier").val("");
                  $("#keterangan").val("");
                  RefreshTable("#example","transaksi/barangMasuk/json.jsp");            
              }              
          });   
          */ });}
        }); 
          
var table= $("#example").dataTable({
     "columnDefs": [ 
			{
				"targets": [ 0 ],
				"visible": false,
				"searchable": true
			},
                        {
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			},
                        {
				"targets": [ 3 ],
				"visible": false,
				"searchable": true
			},
                        {
				"targets": [ 5 ],
				"visible": false,
				"searchable": true
			},
                         {
				"targets": [ 7 ],
				"visible": false,
				"searchable": true
			}
			
		],
                
    
        "sPaginationType": "full_numbers",
        ajax: "transaksi/barangMasuk/jsonAll.jsp"
        });        
         table.fnSort( [[3,"desc"]]);
 
$('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        id= table.fnGetData( this, 0 );  
                        idBrg=table.fnGetData( this, 3 );
                        satuan=table.fnGetData( this, 5 );
                        jumlah=table.fnGetData( this, 7 );
                
                         $("#remove").removeAttr("disabled");
		}
	} );             
        $("#new").click(function(){
            $("#editData").attr("disabled","disabled");
            $("#remove").attr("disabled","disabled");
            $("#kd").val("");
            $("#nm").val("");
            $("#kt").val("");
            $("#kd").removeAttr("disabled");
            $("#save").show();
            $("#edit").hide();
            $("#delete").hide();
            $("#judul").html("Tambah Barang");            
        });              
        $("#remove").click(function(){
           
           if(confirm("Yakin Hapus Data !!")){
               $.ajax({
                   url:"transaksi/barangMasuk/delete.jsp",
                   data:"&id="+id+"&idBrg="+idBrg+"&jumlah="+jumlah,
                   success:function(){
                   RefreshTable("#example","transaksi/barangMasuk/json.jsp");
                                         }
                   });
              }
        });
     
        
            });
 </script>
    <style type="text/css">

.isi-dialog input {
  background-color:white;
  width:70%;
  border:1px solid #ccc;
  display:block;
}
.read{
         background-color:#D5E8E8;
     }
</style>
    
<h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
              Data Barang Masuk
                </h3>
     <div id="kotak-dialog">
         <h3 class="title"><div id="judul"></div><a href="#" class="close">&#215;</a></h3>
		<div class="isi-dialog">

              
			
                <div class="input-control text" data-role="datepicker"

data-format="yyyy-mm-dd"
data-position="top|bottom"
data-effect="none|slide|fade" >
                    <input type="text" id="tanggal" placeholder="Tanggal">
<button class="btn-date"></button>
</div>
                    
                     
                     <div class="input-control text" >
                         <input type="text" name="ref" id="ref" placeholder="No Referensi"><button class="btn-clear"></button>
                     </div>
              
                        <div class="input-control select">
                            <select id="suplier">
                                <option>.:Pilih Suplier:.</option>
<%
connect c=new connect();
String sup="select * from suplier";
ResultSet rsup=c.GetData(sup);
while(rsup.next()){
out.print("<option value="+rsup.getString("suplier_id")+">"+rsup.getString("suplier_nama")+"</option>");
}
%>
</select>
</div>
                     
                     
			
                        <div class="input-control select">
                            <select id="kode">
                                <option>.:Pilih Barang:.</option>
<%
String qw="select * from barang";
ResultSet r=c.GetData(qw);
while(r.next()){
out.print("<option value="+r.getString("barang_id")+">"+r.getString("barang_nama")+"</option>");
}
%>
</select>
</div>

			
                        <div class="input-control select" >
<select id="satuan" name="satuan">
    <option>.:Pilih Satuan:.</option>
</select>
</div>
                                                
<!--<div class="input-control text">
    
    <input type="text" id="harga" placeholder="Harga Barang" onkeyup="totalHarga()"><button class="btn-clear"></button>
    
</div>
-->

<div class="input-control text">
    
    <input type="text" id="jumlah" placeholder="Jumlah Barang" onkeyup="totalHarga()"><button class="btn-clear"></button>
    
</div>
           <!--             

<div class="input-control text">    
    <input type="text" id="total" placeholder="Total harga" readonly class="read" style="background-color: #D5E8E8;"><button class="btn-clear"></button>    
</div>
           -->
                        
                        <div class="input-control  textarea ">
                            <textarea id="keterangan" placeholder="Keterangan"></textarea>
</div>
                         <div class="button-wrapper">
                             <button  id="save" class="save">Simpan</button> 
                              <button  id="edit" class="edit">Ubah</button> 
                               <button  id="delete" class="delete">Hapus</button> 
				<button class="close">Tutup</button>
			</div>		
		</div>
</div>
<div id="dialog-overlay"></div>

  
     <div class="example">
<table id="example" class="display table striped hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
                                            
						<th>Masuk Id</th>
                                                <th>Tanggal</th>
                                                <th style="width: 120px">No Referensi</th>
						<th>Barang Id</th>
                                                <th>Nama Barang</th>
						<th>Satuan ID</th>
                                                <th>Jumlah</th>
                                                <th>Jumlah Detail</th>
                                                <th>Satuan</th>	
                                                <th>Suplier</th>
                                                <th>Keterangan</th>
                                                 
						
					</tr>
				</thead>			
                                <tbody>
					
				</tbody>
			</table>
    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     