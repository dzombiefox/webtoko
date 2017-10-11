<%@page import="config.connect"%>
<%@page import="java.sql.ResultSet"%>
<script type="text/javascript">
    $(document).ready(function(){
         $("#editData").attr("disabled","disabled");
         $("#remove").attr("disabled","disabled")
        var id="";
        var nama="";
        var alamat="";
        var telp="";
        var fax="";
           $('.open-dialog').click(function() {
		$('#kotak-dialog').show();
		$('#dialog-overlay').fadeTo("normal", 0.4);
                return false;
	});
	$('#kotak-dialog .close').click(function() {
           	$('#dialog-overlay, #kotak-dialog').hide();                
		return false;
	}); 
        
         var table= $("#example").dataTable({
              "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			}],
        "sPaginationType": "full_numbers",
        ajax: "master/suplier/json.jsp"        
         });
 $('#example tbody').on( 'click', 'tr', function () {
          $("#editData").removeAttr("disabled");
          $("#remove").removeAttr("disabled");
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        nama=$('td', this).eq(1).text();
                        alamat=$('td', this).eq(4).text();
                        telp=$('td', this).eq(2).text();  
                        fax=$('td', this).eq(3).text();
                        id= table.fnGetData( this, 1 );
                        
      
		}
	} );  
           $("#new").click(function(){
               $("#id").val("");
               $("#nama").val("");
               $("#alamat").val("");
               $("#telp").val("");
               $("#fax").val("");
      $("#editData").attr("disabled","disabled");
         $("#remove").attr("disabled","disabled");
            $("#save").show();
            $("#edit").hide();
            $("#delete").hide();
            $("#judul").html("Tambah Suplier");  
            
        });
        $("#editData").click(function(){
             $("#save").hide();
       $("#edit").show();
       $("#delete").hide();
         $("#nama").val(nama);
         $("#id").val(id);
         $("#alamat").val(alamat);
         $("#telp").val(telp);
         $("#fax").val(fax);
         $("#judul").html("Ubah Data Suplier");              
        });
        $("#edit").click(function(){
           var id=$("#id").val(); 
           var nama=$("#nama").val();
           var alamat=$("#alamat").val();
           var telp=$("#telp").val();
           var fax=$("#fax").val();
           $.ajax({
               data:"id="+id+"&nama="+nama+"&alamat="+alamat+"&telp="+telp+"&fax="+fax,
               url:"master/suplier/update.jsp",
               success:function(data){
                   $("#nama").val("");
                   $("#alamat").val("");
                   $("#telp").val("");
                   $("#fax").val("");
               RefreshTable("#example","master/suplier/json.jsp");  
               $('#dialog-overlay, #kotak-dialog').hide();     
           }
           });
            
        });
        $("#save").click(function(){
           var nama=$("#nama").val();
           var alamat=$("#alamat").val();
           var telp=$("#telp").val();
           var fax=$("#fax").val();
           $.ajax({
               data:"nama="+nama+"&alamat="+alamat+"&telp="+telp+"&fax="+fax,
               url:"master/suplier/save.jsp",
               success:function(data){
                   $("#nama").val("");
                   $("#alamat").val("");
                   $("#telp").val("");
                   $("#fax").val("");
               RefreshTable("#example","master/suplier/json.jsp");  
           }
           });
            
        });
        
              $("#remove").click(function(){
           
           if(confirm("Yakin Hapus Data  ??")){
               $.ajax({
                   url:"master/suplier/delete.jsp",
                   data:"&id="+id,
                   success:function(){
                       RefreshTable("#example","master/suplier/json.jsp"); 
                      
                   }
                   
               });
               
           }
        });
    });
    
</script>
 <div id="kotak-dialog">
         <h3 class="title"><div id="judul"></div><a href="#" class="close">&#215;</a></h3>
		<div class="isi-dialog">
                    <input type="hidden" id="id">
                    <label>Nama Suplier</label>
                     <div class="input-control text" >
                   <input type="text" name="nama" id="nama"><button class="btn-clear"></button>
                     </div>
			
			<label>No Telp</label>
                        <div class="input-control text" >
 <input type="text" name="telp" id="telp"><button class="btn-clear"></button>
</div>

<label>Fax</label>
<div class="input-control text"><input type="text" name="fax" id="fax"><button class="btn-clear"></button></div>
<label>Alamat</label>
<div class="input-control textarea"><textarea id="alamat"></textarea></div>
                         <div class="button-wrapper">
                             <button  id="save" class="save">Simpan</button> 
                              <button  id="edit" class="edit">Ubah</button> 
                               <button  id="delete" class="delete">Hapus</button> 
				<button class="close">Tutup</button>
			</div>		
		</div>
</div>
<div id="dialog-overlay"></div>
<h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
               Master Data Suplier
                </h3>
<button class="open-dialog button info" id="new">Tambah Baru</button>&nbsp;<button class="open-dialog" id="editData">Ubah Pilihan</button>&nbsp;<button class="btn-close" id="remove">Hapus Pilihan</button>
<div class="example">
<table id="example" class="display table striped hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>No</th>
                                                <th>ID</th>
						<th>Nama Suplier</th>						
                                                <th>No Telp</th>
                                                <th>Fax</th>
                                                <th>Alamat</th>
						
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
    </div>
