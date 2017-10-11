<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script type="text/javascript">    
    $(function(){
        $('.open-dialog').click(function() {
		$('#kotak-dialog').show();
		$('#dialog-overlay').fadeTo("normal", 0.4);
                return false;
	});
	$('#kotak-dialog .close').click(function() {
           	$('#dialog-overlay, #kotak-dialog').hide();                
		return false;
	});
    });    
    $(document).ready(function(){    
        $("#editData").attr("disabled","disabled");
        $("#remove").attr("disabled","disabled");
        var kode;
        var name;
        var kategory;
        $("#save").click(function(){
           var kd=$("#kd").val(); 
           var nm=$("#nm").val();
           var kt=$("#kt").val();
           var text=$('#kt :selected').text();
           if(kd==""){
               alert("Kode barang tidak boleh kosong");
                $("#kd").focus();        
           }
           else if(nm==""){
               alert("Nama Barang tidak boleh kosong");
               $("#nm").focus();
               
           }
           else if(kt==null){
               alert("Pilih kategory");
               $("#kt").focus();
               
           }
           else{
          $.ajax({
              url:"master/barang/save.jsp",
              data:"&kd="+kd+"&nm="+nm+"&kt="+kt,
              success:function(data){
                  $("#kd").val("");
                  $("#nm").val("");
                  $("#kt").val("");
                  RefreshTable("#example","master/barang/json.jsp");            
              }              
          });   
           }
        }); 
        $("#edit").click(function(){
           var kd=$("#kd").val(); 
           var nm=$("#nm").val();
           var kt=$("#kt").val();
            $.ajax({
              url:"master/barang/update.jsp",
              data:"&kd="+kd+"&nm="+nm+"&kt="+kt,
              success:function(data){
                   RefreshTable("#example","master/barang/json.jsp");   
                  $("#kd").val("");
                  $("#nm").val("");
                  $("#kt").val("");    
                  $('#dialog-overlay, #kotak-dialog').hide();
              }              
          });             
        });     
var table= $("#example").dataTable({
        "sPaginationType": "full_numbers",
        ajax: "master/barang/json.jsp"
        });        
$('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        kode=$('td', this).eq(1).text();
                        name=$('td', this).eq(2).text();
                        kategory=$('td', this).eq(3).text();      
                        $("#editData").removeAttr("disabled");
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
            $("#editData").click(function(){
            $("#save").hide();
            $("#edit").show();
            $("#delete").hide();
            $("#kd").attr("disabled","disabled")
            $("#judul").html("Edit Barang"); 
            $("#kd").val(kode);
            $("#nm").val(name);   
            $("select#kt option").each(function() { this.selected = (this.text == kategory); });   
        });
        $("#remove").click(function(){
           
           if(confirm("Yakin Hapus Data  "+kode)){
               $.ajax({
                   url:"master/barang/delete.jsp",
                   data:"&kd="+kode,
                   success:function(){
                       RefreshTable("#example","master/barang/json.jsp"); 
                      
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

</style>
  <h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
               Master data barang
                </h3>

     <div id="kotak-dialog">
         <h3 class="title"><div id="judul"></div><a href="#" class="close">&#215;</a></h3>
		<div class="isi-dialog">

                    <label>Kode Barang</label>
			<div class="input-control text"><input type="text" name="kd" id="kd"><button class="btn-clear"></button></div>
			 <label>Nama Barang</label>
                         <div class="input-control text"><input type="text" name="nm" id="nm"><button class="btn-clear"></button></div>
			<label>Kategori</label>
                        <div class="input-control select" >
<select id="kt" name="kt">
<%
connect c=new connect();
String q="select * from kategori";
ResultSet rs=c.GetData(q);
while(rs.next()){
out.print("<option value="+rs.getString("kategori_id")+">"+rs.getString("kategori_nama")+"</option>");
}
%>
</select>
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

<button class="open-dialog button info" id="new">Tambah Baru</button>&nbsp;<button class="open-dialog" id="editData">Ubah Pilihan</button>&nbsp;<button class="btn-close" id="remove">Hapus Pilihan</button>
    
     <div class="example">
<table id="example" class="display table striped hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>No</th>
						<th>Kode Barang</th>
						<th>Nama Barang</th>
						<th>Kategory</th>
						
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
    </div>