<script type="text/javascript">
    $(document).ready(function(){
        var level=$("#level").val();
        if(level=="user"){
            alert("maaf anda tidak bisa Akses Halaman Ini");
            document.location='admin.jsp';
            
        }
        
    });
    
</script>

<% 
 
       out.print("<input type='hidden' value='"+session.getAttribute("level")+"' id='level'>");
    %>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script type="text/javascript">
    $(document).ready(function(){
        $("#editData").attr("disabled","disabled");
        $("#remove").attr("disabled","disabled");
        var id="";
        var table= $("#example").dataTable({
            "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			}
			
		],
        "sPaginationType": "full_numbers",
        ajax: "master/user/json.jsp"
        });           
   $('#example tbody').on( 'click', 'tr', function () {
          
          $("#remove").removeAttr("disabled");
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
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
            var nama=$("#nama").val();
            var username=$("#username").val();
            var password=$("#password").val();
            var level=$("#level").val();
               if(nama==""){
                   alert("Nama tidak boleh kosong");
                   
               }   
               else if(username==""){
                   alert("Username tidak boleh kosong");
                   
               }   
              else if(password==""){
                   alert("password tidak boleh kosong");
                   
               }   
               else{
               
            $.ajax({
              url:"master/user/save.jsp",
              data:"&username="+username+"&password="+password+"&level="+level+"&nama="+nama,
              success:function(data){
                  $("#nama").val("");
                  $("#username").val("");
                  $("#password").val("");
                  $("#level").val("");
                  
                  
         RefreshTable("#example","master/user/json.jsp"); 
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
            $("#judul").html("Tambah User Login");  
            $("#id").val("");
            $("#kode").val("");
            $("#sb").val("");
            $("#sk").val("");
            $("#jumlah").val("");
        });
        
 
   
      $("#remove").click(function(){
           
           if(confirm("Yakin Hapus Data !!")){
               $.ajax({
                   url:"master/user/delete.jsp",
                   data:"&id="+id,
                   success:function(){
                       RefreshTable("#example","master/user/json.jsp"); 
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
                   
<label>Nama</label>
<div class="input-control text"><input type="text" name="nama" id="nama"><button class="btn-clear"></button></div>			
<label>Username</label>
<div class="input-control text"><input type="text" name="username" id="username"><button class="btn-clear"></button></div>

<label>Password</label>
<div class="input-control password" data-role="input-control">
                                            <input type="password"  autofocus id="password">
                                            <button class="btn-reveal" tabindex="-1"></button>
                                        </div>  

<label>Level</label>
                        <div class="input-control select" >
<select id="level" name="level">
    <option>admin</option>
    <option>user</option>
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
<h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
               Master Data User
                </h3>

<button class="open-dialog button info" id="new">Tambah Baru</button>&nbsp;<button class="btn-close" id="remove">Hapus Pilihan</button>
<div class="example">
<table id="example" class="display table striped hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>No</th>
                                                <th>ID</th>
                                                <th>Nama</th>
                                            	<th>Username</th>
						<th>Level</th>
                                               
						
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
    </div>
