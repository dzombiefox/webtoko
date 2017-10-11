<script type="text/javascript">
    $(document).ready(function(){
          var level=$("#level").val();
        if(level=="user"){
            alert("maaf anda tidak bisa Akses Halaman Ini");
            document.location='admin.jsp';
            
        }
         var table= $("#example").dataTable({
        "sPaginationType": "full_numbers",
        ajax: "ubahStok/json.jsp"
        });
        setInterval( function () {
    table.ajax.reload();
}, 100 );
    });
    
</script>

<% 
 
       out.print("<input type='hidden' value='"+session.getAttribute("level")+"' id='level'>");
    %>
 
    <h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
              Data perubahan stok
                </h3>
<div class="example">
<table  id="example" class="display table striped hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
                                               	<th>No</th>
                                                <th>Tanggal</th>
						<th>Barang</th>
						<th>Satuan</th>
                                                <th>Stok Awal</th>
						<th>Stok Akhir</th>
						<th>Keterangan</th>
						
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
    </div>
