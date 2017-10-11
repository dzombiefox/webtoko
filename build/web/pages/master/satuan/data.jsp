<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script type="text/javascript">
    $(document).ready(function(){
        $("#editData").attr("disabled","disabled");
        $("#remove").attr("disabled","disabled");
        var id="";
        var nama="";
        var sb="";
        var sk="";
        var jumlah="";
        var sat="";
        var bid="";
        var table= $("#example").dataTable({
            "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			},
                        {
				"targets": [3 ],
				"visible": false,
				"searchable": true
			},
                        {
				"targets": [7 ],
				"visible": false,
				"searchable": true
			},
			
		],
        "sPaginationType": "full_numbers",
        ajax: "master/satuan/json.jsp"
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
                        sb=$('td', this).eq(2).text();
                        jumlah=$('td', this).eq(3).text();
                        sk=$('td', this).eq(4).text();                     
                        id= table.fnGetData( this, 1 );  
                        sat= table.fnGetData( this, 3 ); 
                        bid= table.fnGetData( this, 7 ); 
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
            var nama=$("#kode option:selected").text();
            var sb=$("#sb").val();
            var sk=$("#sk").val();
            var jumlah=$("#jumlah").val();
            var sbesar=$("#sb option:selected").text();
            var skecil=$("#sk option:selected").text();
            if(kode==null){
                alert("silahkan Pilih barang dahulu");
                $("#kode").focus();
            }
            else if(sb==null){
                alert("silahkan Pilih satuan Besar");
                $("#sb").focus();
            }
            else if(sk==null){
                alert("silahkan Pilih satuan Kecil");
                $("#sk").focus();
            }
            else if(jumlah==""){
                alert("Jumlah Tidak boleh kosong");
               $("#jumlah").focus();
            }
            else{
            $.ajax({
                
                url:"master/satuan/cekSatuan.jsp",
                data:"kode="+kode+"&sb="+sb+"&sk="+sk,
                success:function(data){
                    var hasil=parseInt(data);
                    if(hasil==1){
                         $.ajax({
              url:"master/satuan/save.jsp",
              data:"&kode="+kode+"&sb="+sb+"&sk="+sk+"&skecil="+skecil+"&jumlah="+jumlah,
              success:function(data){
                  $("#kode").val("");
                  $("#sb").val("");
                  $("#sk").val("");
                  $("#jumlah").val("");
               
         RefreshTable("#example","master/satuan/json.jsp"); 
                    }
                    
               });
                    }
                    else{
                        alert("maaf satuan sudah terdaftar");
                    }
                    
                }
            });    
            
            /*
            $.ajax({
              url:"master/satuan/save.jsp",
              data:"&kode="+kode+"&sb="+sb+"&sk="+sk+"&skecil="+skecil+"&jumlah="+jumlah,
              success:function(data){
                  $("#kode").val("");
                  $("#sb").val("");
                  $("#sk").val("");
                  $("#jumlah").val("");
               
         RefreshTable("#example","master/satuan/json.jsp"); 
                    }
                    
               });*/
               
           }
            });
  $("#new").click(function(){
      $("#editData").attr("disabled","disabled");
         $("#remove").attr("disabled","disabled");
            $("#save").show();
            $("#edit").hide();
            $("#delete").hide();
            $("#judul").html("Tambah Satuan Jumlah Barang");  
            $("#id").val("");
            $("#kode").val("");
            $("#sb").val("");
            $("#sk").val("");
            $("#jumlah").val("");
        });
        
   $("#editData").click(function(){
       $("#save").hide();
       $("#edit").show();
       $("#delete").hide();
       $("#judul").html("Edit Satuan Jumlah Barang");        
       $("#id").val(id);
       $("select#kode option").each(function() { this.selected = (this.text == nama); });
       $("select#sb option").each(function() { this.selected = (this.text == sb); }); 
       $("select#sk option").each(function() { this.selected = (this.text == sk); }); 
       $("#jumlah").val(jumlah);
     });     
   
  $("#remove").click(function(){           
           if(confirm("Yakin Hapus Data  !!")){
               $.ajax({
                   url:"master/satuan/delete.jsp",
                   data:"&id="+id,
                   success:function(){
                       RefreshTable("#example","master/satuan/json.jsp"); 
                        }
                 });              
           }
        });
  $("#edit").click(function(){
       var id=$("#id").val(); 
       var kode=$("#kode").val(); 
       var sb=$("#sb").val();
       var sk=$("#sk").val();
       var jumlah=$("#jumlah").val();    
       var skecil=$("#sk option:selected").text(); 
      $.ajax({
          url:"master/satuan/update.jsp",
          data:"&id="+id+"&kode="+kode+"&sb="+sb+"&sk="+sk+"&skecil="+skecil+"&jumlah="+jumlah,
          success:function(data){
              $("#kode").val("");
              $("#sb").val("");
              $("#sk").val("");
              $("#jumlah").val("");
                RefreshTable("#example","master/satuan/json.jsp");
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
			
			<label>Satuan Besar</label>
                        <div class="input-control select" >
<select id="sb" name="sb">
<%
String q="select * from satuan";
ResultSet rs=c.GetData(q);
while(rs.next()){
out.print("<option value="+rs.getString("satuan_id")+">"+rs.getString("satuan_nama")+"</option>");
}
%>
</select>
</div>

<label>Satuan Terkecil</label>
                        <div class="input-control select" >
<select id="sk" name="sk">
<%
String que="select * from satuan";
ResultSet rsl=c.GetData(que);
while(rsl.next()){
out.print("<option value="+rsl.getString("satuan_id")+">"+rsl.getString("satuan_nama")+"</option>");
}
%>
</select>
</div>

<label>Jumlah</label>
<div class="input-control text"><input type="text" name="jumlah" id="jumlah"><button class="btn-clear"></button></div>
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
                    <a><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
               Master Data Satuan Jumlah
                </h3>


<button class="open-dialog button info" id="new">Tambah Baru</button>&nbsp;<button class="open-dialog" id="editData">Ubah Pilihan</button>&nbsp;<button class="btn-close" id="remove">Hapus Pilihan</button>
<div class="example">
<table id="example" class="display table striped hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>No</th>
                                                <th>ID</th>
                                            	<th>Nama Barang</th>
                                                <th>Satuan Id</th>
						<th>Satuan</th>
                                                <th>Jumlah</th>
                                                <th>Satuan Terkecil</th>
						<th>Barang Id</th>
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
    </div>
