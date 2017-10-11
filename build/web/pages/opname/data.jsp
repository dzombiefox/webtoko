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
var level=$("#level").val();
        if(level=="user"){
           $("#editData").attr("disabled","disabled");
            
        }
       var id;
       var jumlah;
       var nama;
       var sawal;
       var satuan;
        var table= $("#example").dataTable({
        "sPaginationType": "full_numbers",
        ajax: "opname/json.jsp",
        "sDom": "Tlfrtip ",
        "tableTools": {
            "sSwfPath": "swf/copy_csv_xls_pdf.swf",            
             "aButtons": [
        {
            "sExtends": "copy",
            "oSelectorOpts": { filter: 'applied', order: 'current' }
        },
        {
            "sExtends": "xls",
            "oSelectorOpts": { filter: 'applied', order: 'current' },
            "sFileName": "file.xls"
        },
             
        {
            "sExtends": "print",
            "oSelectorOpts": { filter: 'applied', order: 'current' },
        }
        ]
        },
        "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": false
			}]
        });   
        
        
         $('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                    
                        nama=$('td', this).eq(2).text();
                        sawal=$('td', this).eq(4).text();
                        satuan=$('td', this).eq(5).text();
                        id= table.fnGetData( this, 1 );      
                             
                      
		}
	} );  
        
        $("#editData").click(function(){
             $("#judul").html("Edit Stok Barang"); 
             $("#id").val(id);
             $("#nm").val(nama);
             $("#sawal").val(sawal);
             $("#satuan").val(satuan);
        });
        $("#save").click(function(){
            var id=$("#id").val();
            var saw=$("#sawal").val();
            var sak=$("#sakhir").val();
            var ket=$("#keterangan").val();
            var sat=$("#satuan").val();
            $.ajax({
                url:"opname/updateStok.jsp",
                data:"id="+id+"&saw="+saw+"&sak="+sak+"&ket="+ket+"&satuan="+sat,
                success:function(data){
                    $("#id").val("");
                    $("#nm").val("");
                    $("#sawal").val("");
                    $("#sakhir").val("");
                    $("#keterangan").val("");
                    $("#satuan").val("");
                   RefreshTable("#example","opname/json.jsp"); 
                    
                }
                
            });
            
        });
    });
    
</script> 

 

   <div id="kotak-dialog">
         <h3 class="title"><div id="judul"></div><a href="#" class="close">&#215;</a></h3>
		<div class="isi-dialog">
                    <input type="hidden" id="id" />
                    <input type="hidden" id="satuan" />
                   
			 <label>Nama Barang</label>
                         <div class="input-control text"><input type="text" name="nm" id="nm" readonly><button class="btn-clear"></button></div>
			<label>Stok Awal</label>
                      <div class="input-control text"><input type="text" name="sawal" id="sawal" readonly><button class="btn-clear"></button></div>
                      <label>Stok Akhir</label>
                      <div class="input-control text"><input type="text" name="sakhir" id="sakhir"><button class="btn-clear"></button></div>
                             <label>Keterangan</label> 
                             <div class="input-control textarea">
                                 <textarea id="keterangan"></textarea> 
                                 
                             </div>
                      <div class="button-wrapper">
                             <button  id="save" class="save">Simpan</button> 
                             <button class="close">Tutup</button>
			</div>		
		</div>
</div>
<% 
 
       out.print("<input type='hidden' value='"+session.getAttribute("level")+"' id='level'>");
    %>
<div id="dialog-overlay"></div>

<h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
              Transaksi Peubahan stok
                </h3>
 <button class="open-dialog button button info" id="editData">Ubah Stok</button>
 <div class="example">   
<table id="example" class="display table  hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>No</th>
                                                <th>ID</th>
						<th>Kode Barang</th>
						<th>Nama Barang</th>
						<th>Kategory</th>
                                                <th>Stok</th>
                                                <th>Satuan</th>
						
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
 </div>