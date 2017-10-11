<script type="text/javascript">
    $(document).ready(function(){
        var level=$("#level").val();
        if(level=="user"){
           $("#remove").attr("disabled","disabled");
            
        }
        var kode=0;
        var table= $("#example").dataTable({
        "sPaginationType": "full_numbers",
        
        ajax: "transaksi/barangKeluar/json.jsp",         
           "scrollY":"200px",
            "scrollCollapse": true,
           
            "bLengthChange": false,
           
            "bSort": false,
            "bInfo": false,
        });  
        table.fnSort( [[0,"desc"]]);
        $('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        kode=$('td', this).eq(0).text();
                       
		}
	} );  
        $("#view").click(function(){
             $("#detailPage").load("transaksi/barangKeluar/detail.jsp?kode="+kode);
             $("#remove").attr("disabled","disabled")
            
        });
        $("#remove").click(function(){
            if(kode=="0"){
alert("Pilih dulu data");                
            }
            else if(confirm("Yakin Hapus Data  "+kode)){{
                $.ajax({
                url:"transaksi/barangKeluar/remove.jsp",
                data:"kode="+kode,
                success:function(data){
                     RefreshTable("#example","transaksi/barangKeluar/json.jsp"); 
                    $("#detailPage").html("");
                }
                
                
            });
        }
        }
         });
         
        $("#print").bind('click',function() {
           var thePopup = window.open( 'transaksi/barangKeluar/dataPrint.jsp?kode='+kode, "Customer Listing", "scrollbars=1,menubar=0,location=0,height=auto,width=500" );
    $('#popup-content').clone().appendTo( thePopup.document.body );
    thePopup.print();
            
        }); 
        
    });
    
</script>


<% 
 
       out.print("<input type='hidden' value='"+session.getAttribute("level")+"' id='level'>");
    %>
    
    <h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
               Data Barang Keluar
                </h3>
    <button class="btn-close button info" id="remove">Hapus Pilihan</button>&nbsp;<button class="btn-close" id="print">Print Pilihan</button>&nbsp;<button class="btn-close" id="view">View Detail</button>
   
    <div class="example">      

<table  id="example" class="display table striped hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
                                               	<th>Kode</th>
                                                <th>Tanggal</th>
						<th>Pembeli</th>
						<th>Total</th>
                                                <th>Potongan</th>
						<th>Bayar</th>
						<th>Kembali</th>
						
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
    </div>
<div id="detailPage"></div>