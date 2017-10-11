<%@page import="config.connect"%>
<%@page import="java.sql.ResultSet"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");

%>
<script type="text/javascript">
    $(document).ready(function(){
        $("#save").click(function(){
            var pilihan=$("input[name=pilihan]:checked").val();
            var idNya=$("#idNya").val();
            var idSatuan=$("#idSatuan").val();
            var jumlah=$("#jumlah").val();
            var rsatuan=$("#rsatuan").val();
            var rjumlah=$("#rjumlah").val();
            var kembali=$("#kembali").val();
            var keterangan=$("#keterangan").val();
            var kjual=$("#kjual").val();
            $.ajax({
              url:"transaksi/retur/save.jsp",
              data:"idNya="+idNya+"&idSatuan="+idSatuan+"&jumlah="+jumlah+"&rsatuan="+rsatuan+"&rjumlah="+rjumlah+"&kembali="+kembali+"&keterangan="+keterangan+"&kjual="+kjual+"&pilihan="+pilihan,
              success:function(data){
               $("#idNya").val("");
               $("#idSatuan").val("");
               $("#jumlah").val("");
               $("#rsatuan").val("");
               $("#rjumlah").val("");
               $("#kembali").val("");
               $("#keterangan").val("");
               $("#nama").val("");
               $("#satuan").val("");
               $("#jumlah").val("");
               $('#dialog-overlay, #kotak-dialog').hide();    
              }
                
            });
        });
         $('#jumlah').change(function(){
					console.log('Second change event...');
				});				
  $('#jumlah').number( true );
  $('#rjumlah').change(function(){
					console.log('Second change event...');
				});				
  $('#rjumlah').number( true );
   $('#kembali').change(function(){
					console.log('Second change event...');
				});				
  $('#kembali').number( true );
  $("#rsatuan").change(function(){
      $("#kembali").val("");
      $("#rjumlah").val("");
      
  });
  $("#hapus").click(function(){
      $("#kembali").val("");
  });
  $("#rjumlah").keyup(function(){
      var idNya=$("#idNya").val();
      var idSatuan=$("#idSatuan").val();
      var jumlah=$("#jumlah").val();
      var rsatuan=$("#rsatuan").val();
      var rjumlah=$("#rjumlah").val();
      $.ajax({
          url:"transaksi/retur/cekHarga.jsp",
          data:"idNya="+idNya+"&idSatuan="+idSatuan+"&jumlah="+jumlah+"&rsatuan="+rsatuan+"&rjumlah="+rjumlah,
          success:function(data){
              if(data==1){
                  alert("Data yang anda masukkan melebihi jumlah !!");
                  $("#kembali").val("");
                  $("#rjumlah").val("");
              }
              else{
                  $("#kembali").val(parseFloat(data));
                  
              }
              
          }
          
      });
      
  });
  
  
	$("#returBarang").click(function(){
            var idSat=idSatuan;
             $("#judul").html("Retur Barang"); 
             $("#nama").val(nama);
             $("#satuan").val(satuan);
             $("#jumlah").val(jumlah);
             $("#idNya").val(kode);
             $("#idSatuan").val(idSatuan);
            
             var items="";
var sat=$("#idSatuan").val();
  $.getJSON("transaksi/retur/listSatuan.jsp?id="+kode,function(data){
    $.each(data,function(index,item) 
    {
      items+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#rsatuan").html(items); 
       
  });
             
         });
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
        $("#close").click(function(){            
            $("#data").html("");
         });
        var id=$("#kd").val();
        var kode=0;
        var idSatuan=$("#idSatuan").val();
        var nama="";
        var satuan="";
        var jumlah="";
        var table= $("#example").dataTable({
            "columnDefs": [ 
			{
				"targets": [ 0 ],
				"visible": false,
				"searchable": true
			},
        {
				"targets": [ 2 ],
				"visible": false,
				"searchable": true
			}            
        ],            
        "sPaginationType": "full_numbers",        
        ajax: "transaksi/retur/json.jsp?kode="+id,         
        
            "bPaginate":false,
            "bLengthChange": false,
            "bFilter": false,
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
                        nama=$('td', this).eq(0).text(); 
                        satuan=$('td', this).eq(1).text(); 
                        jumlah=$('td', this).eq(2).text(); 
                        kode=table.fnGetData(this, 0);
                        idSatuan=table.fnGetData(this, 2);
                        
                       // alert(kode);                       
		}
	} );  
 
      
        
    });
    
</script>
<br>

<%  
       out.print("<input type='hidden' value='"+session.getAttribute("level")+"' id='level'>");
%>
    
  
   <div class="example">      
<button class="button info" id="close">Tutup</button>&nbsp;&nbsp;<button class="button info open-dialog" id="returBarang">Retur Barang</button>
    <br>
    <br>
    <input type="hidden" id="kd" value="<%=kode%>">
<table  id="example" class="display table  hovered bordered" cellspacing="0" width="100%">
				<thead>
					<tr>
    <th>Kode Barang</th>
    <th>Nama Barang</th>
    <th>Satuan id</th>
    <th>Satuan</th>
    <th>Jumlah</th>
    <th>Harga</th>
    <th>Total</th>
						
						
					</tr>
				</thead>

				

				<tbody>
					
				</tbody>
			</table>
    </div>

    
    

<div id="kotak-dialog" style="margin-top: -100px" >
         <h3 class="title"><div id="judul"></div><a href="#" class="close">&#215;</a></h3>
		<div class="isi-dialog">
                    <table style="width:100%">
                        <tr>
                            <td>Nama Barang</td>
                            <td>:</td>
                            <td><div class="input-control text"><input type="hidden" id="kjual" value="<%=kode%>" /><input type="hidden" id="idNya" name="idNya"/><input type="text" name="nama" id="nama" readonly class="read"></div></td>
                        </tr>
                        <tr>
                            <td>Satuan</td>
                            <td>:</td>
                            <td> <div class="input-control text"><input type="hidden" id="idSatuan" /><input type="text" name="satuan" id="satuan" readonly class="read"></div></td>
                            
                        </tr>
                        <tr>
                            <td>Jumlah</td>
                            <td>:</td>
                            <td><div class="input-control text size2"><input type="text" name="jumlah" id="jumlah" readonly class="read"></div></td>
                        </tr>
                        
                        <tr>
                            <td>Retur Satuan</td>
                            <td>:</td>
                            <td><div class="input-control select" >
                                    <select name="rsatuan" id="rsatuan">
                             
                            </select></div></td>
                            
                        </tr>
                        
                        <tr>
                            <td>Retur Jumlah</td>
                            <td>:</td>
                            <td> <div class="input-control text size2"><input type="text" name="rjumlah" id="rjumlah"><button class="btn-clear" id="hapus"></button></div></td>
                        </tr>
                        <tr>
                            <td>Kembalian</td>
                            <td>:</td>
                            <td><div class="input-control text "><input type="text" id="kembali" readonly class="read" /></div></td>
                            
                        </tr>
                        <tr>
                            <td>Pilihan</td>
                            <td>:</td>
                            <td>
                                
                                <div class="input-control radio margin10" data-role="input-control">
                                    <label>
                                        Kembalikan Ke stok
                                        <input type="radio" name="pilihan" checked  id="pilihan" value="1"/>
                                        <span class="check"></span>
                                    </label>
                                </div>
                                <div class="input-control radio margin10" data-role="input-control">
                                    <label>
                                       Musnahkan Barang
                                       <input type="radio" name="pilihan"  id="pilihan" value="0"/>
                                        <span class="check"></span>
                                    </label>
                                </div>
                            </td>
                        </tr>
                       
                        <tr>
                            <td>Keterangan</td>
                            <td>:</td>
                            <td><div class="input-control textarea"><textarea id="keterangan"></textarea></div></td>
                        </tr>
                    </table>
                            
</div>
                         <div class="button-wrapper">
                             <button  id="save" class="save">Simpan</button> 
                            
				<button class="close">Tutup</button>
                         </div>	
         <br>
         
		</div>
</div>
                           
<div id="dialog-overlay"></div>

