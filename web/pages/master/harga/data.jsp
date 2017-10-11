<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script type="text/javascript">
   
    $(document).ready(function(){
        $('#harga').change(function(){
					console.log('Second change event...');
				});
				
	$('#harga').number( true );
        $('#beli').change(function(){
					console.log('Second change event...');
				});
				
	$('#beli').number( true );
        
         $("#editData").attr("disabled","disabled");
         $("#remove").attr("disabled","disabled");        
        var id="";
        var kode="";
        var satuan="";
        var beli="";
        var harga="";
        var potong="";
        var tpotong;
        var pbeli;
        var tbeli;
        var table= $("#example").dataTable({
            "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			}
			
		],
        "sPaginationType": "full_numbers",
        ajax: "master/harga/json.jsp"
        });     
        $("#kode").change(function(){
          var kode=$("#kode").val();
          $.ajax({
              url:"master/harga/cekSatuan.jsp",
              data:"kode="+kode,
              success:function(data){
                $("#satuan").html(data); 
                  
              }
          });
            
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
                        kode=$('td', this).eq(1).text();
                        satuan=$('td', this).eq(2).text();
                        beli=$('td', this).eq(3).text();
                        harga=$('td', this).eq(4).text(); 
                        potong=harga.slice(3);
                        pbeli=beli.slice(3);
                        tbeli=pbeli.replace(/\./g, '');
                        tpotong=potong.replace(/\./g, '');
                        id= table.fnGetData( this, 1 );
                        
      
		}
	} );    
        $('.open-dialog').click(function() {
		$('#kotak-dialog').show();
		$('#dialog-overlay').fadeTo("normal", 0.4);
                return false;
	});
	$('#kotak-dialog .close').click(function() {
           	$('#dialog-overlay, #kotak-dialog').hide();                
		return false;
	});   
        $("#save").click(function(){
            var kode=$("#kode").val();
            var satuan=$("#satuan").val();
            var tharga=$("#harga").val();
            var tbeli=$("#beli").val();
            var  harga=tharga.replace(/\./g, '');
            var  beli=tharga.replace(/\./g, '');
            var kd=$("#kode option:selected").text();
            var st=$("#satuan option:selected").text();
           
            if(kode==null){
                alert("Pilih barang dahulu");
                $("#kode").focus(); 
                
            }
            else if(satuan==null){
                alert("pilih satuan dahulu");
                $("#satuan").focus();
            }
            else if(harga==""){
                alert("Harga Jual tidak boleh kosong");
                $("#harga").focus();
            }
            else if(beli==""){
                alert("Harga Beli tidak boleh kosong");
                $("#beli").focus();
            }
            else{
            $.ajax({
              url:"master/harga/save.jsp",
              data:"&kode="+kode+"&satuan="+satuan+"&harga="+harga+"&beli="+beli,
              success:function(data){
                  $("#kode").val("");
                  $("#satuan").val("");
                  $("#harga").val("");
                  $("#beli").val("");
                  RefreshTable("#example","master/harga/json.jsp");  
                 
                    }              
               });
           }
            });
  $("#new").click(function(){
      $("#editData").attr("disabled","disabled");
         $("#remove").attr("disabled","disabled");
            $("#save").show();
            $("#edit").hide();
            $("#delete").hide();
            $("#judul").html("Tambah Harga Barang");  
            $("#id").val("");
            $("#kode").val("");
            $("#satuan").val("");
            $("#harga").val("");
            $("#beli").val("");
        });
        
   $("#editData").click(function(){
       $("#save").hide();
       $("#edit").show();
       $("#delete").hide();
       $("#judul").html("Edit Harga Barang"); 
       $("#kode").val(kode);
       $("#id").val(id);
       $("select#kode option").each(function() { this.selected = (this.text == kode); });
       $("select#satuan option").each(function() { this.selected = (this.text == satuan); }); 
       $("#harga").val(tpotong);
       $("#beli").val(tbeli);
       
       
   });      
   
      $("#remove").click(function(){
           
           if(confirm("Yakin Hapus Data  ??")){
               $.ajax({
                   url:"master/harga/delete.jsp",
                   data:"&id="+id,
                   success:function(){
                       RefreshTable("#example","master/harga/json.jsp"); 
                      
                   }
                   
               });
               
           }
        });
     
  $("#edit").click(function(){
       var id=$("#id").val(); 
       var kode=$("#kode").val(); 
       var satuan=$("#satuan").val();
       var harga=$("#harga").val();
       var beli=$("#beli").val();
      
      $.ajax({
          url:"master/harga/update.jsp",
          data:"&id="+id+"&kode="+kode+"&satuan="+satuan+"&harga="+harga+"&beli="+beli,
          success:function(data){
              $("#kode").val("");
              $("#satuan").val("");
              $("#harga").val("");
              $("#beli").val("");
               RefreshTable("#example","master/harga/json.jsp");  
               $('#dialog-overlay, #kotak-dialog').hide(); 
              
          }
          
          
      });
      
      
  });      
        
    });
    
    
    
</script>
  <div id="kotak-dialog">
         <h3 class="title"><div id="judul"></div><a href="#" class="close">&#215;</a></h3>
		<div class="isi-dialog">
                    <input type="hidden" id="id">
                    <label>Nama Barang</label>
                     <div class="input-control select" >
                    <select id="kode" name="kode">
                        <%
                        connect c=new connect();
                        String qu="select * from barang";
                        ResultSet rst=c.GetData(qu);
                        while(rst.next()){
                        out.print("<option value="+rst.getString("barang_id")+">"+rst.getString("barang_nama")+"</option>");
                        }
                        %>
                        
                    </select>
                     </div>
			
			<label>Satuan</label>
                        <div class="input-control select" >
<select id="satuan" name="satuan">

</select>
</div>
<label>Harga Beli</label>
<div class="input-control text"><input type="text" name="beli" id="beli" value="0" ><button class="btn-clear"></button></div>
<label>Harga Jual</label>
<div class="input-control text"><input type="text" name="harga" id="harga" value="0" ><button class="btn-clear"></button></div>
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
               Master Data Harga
                </h3>

<button class="open-dialog button info" id="new">Tambah Baru</button>&nbsp;<button class="open-dialog" id="editData">Ubah Pilihan</button>&nbsp;<button class="btn-close" id="remove">Hapus Pilihan</button>
<div class="example">
<table id="example" class="display table striped hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>No</th>
                                                <th>Id</th>
						<th>Nama Barang</th>
						<th>Satuan</th>
                                                <th>Harga Beli</th>
						<th>Harga Jual</th>
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
    </div>
