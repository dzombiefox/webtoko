<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script type="text/javascript">
         $(document).ready(function(){

      
        var table= $("#example").dataTable({
        "sPaginationType": "full_numbers",
        ajax: "transaksi/retur/jsonRetur.jsp",
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
               Data Barang Retur 
                </h3>

 <div class="example">   
<table id="example" class="display table  hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Tanggal</th>
                                                <th>Kode</th>
						<th>Nama Barang</th>
						<th>Jumlah</th>
                                                <th>Satuan</th>
                                                <th>Uang Kembali</th>
                                                <th>Pilihan</th>
						<th>Keterangan</th>
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
 </div>