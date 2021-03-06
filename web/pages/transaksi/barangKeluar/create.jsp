                                                                               <%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script>
(function( $ ) {
$.widget( "custom.combobox", {
_create: function() {
this.wrapper = $( "<span>" )
.addClass( "custom-combobox" )
.insertAfter( this.element );
this.element.hide();
this._createAutocomplete();
this._createShowAllButton();

},
_createAutocomplete: function() {
var selected = this.element.children( ":selected" ),
value = selected.val() ? selected.text() : "";

this.input = $( "<input>" )
.appendTo( this.wrapper )
.val( value )
.attr( "title", "" )
.addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
.autocomplete({
delay: 0,
minLength: 0,
source: $.proxy( this, "_source" ),

})
.tooltip({
tooltipClass: "ui-state-highlight"
});
this._on( this.input, {
    
autocompleteselect: function( event, ui ) {
ui.item.option.selected = true;
this._trigger( "select", event, {
item: ui.item.option
});
var barang=$(".barang").val();
   $.ajax({
                    url:"transaksi/barangKeluar/cekSatuan.jsp",
                    data:"kode="+barang,
                    success:function(data){                         
                    $("#satuan").html(data);                        
                    }     
                }); 


},
autocompletechange: "_removeIfInvalid"
});

},
_createShowAllButton: function() {   
var input = this.input,
wasOpen = false;
$( "<a>" )
.attr( "tabIndex", -1 )

.tooltip()
.appendTo( this.wrapper )
.button({
icons: {
primary: "ui-icon-triangle-1-s"
},

text: false
})
.removeClass( "ui-corner-all" )
.addClass( "custom-combobox-toggle ui-corner-right" )
.mousedown(function() {
wasOpen = input.autocomplete( "widget" ).is( ":visible" );

})
.click(function() {
input.focus();
// Close if already visible
if ( wasOpen ) {
return;
}
// Pass empty string as value to search for, displaying all results
input.autocomplete( "search", "" );
});

},
_source: function( request, response ) {
var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
response( this.element.children( "option" ).map(function() {
var text = $( this ).text();
if ( this.value && ( !request.term || matcher.test(text) ) )
return {
label: text,
value: text,
option: this
};
}) );

},
_removeIfInvalid: function( event, ui ) {
// Selected an item, nothing to do
if ( ui.item ) {
   
return;
}
// Search for a match (case-insensitive)
var value = this.input.val(),
valueLowerCase = value.toLowerCase(),
valid = false;
this.element.children( "option" ).each(function() {
if ( $( this ).text().toLowerCase() === valueLowerCase ) {
this.selected = valid = true;
return false;

}
});
// Found a match, nothing to do
if ( valid ) {
    
return;
}
// Remove invalid value
this.input
.val( "" )
.attr( "title", " Maaf Item yang anda Ketik Tidak cocok !!" )
.tooltip( "open" );

this.element.val( "" );
this._delay(function() {
    
this.input.tooltip( "close" ).attr( "title", "" );
}, 2500 );
this.input.autocomplete( "instance" ).term = "";
},
_destroy: function() {
this.wrapper.remove();
this.element.show();

}
});
})( jQuery );
$(function() {
$( "#combobox" ).combobox();
$("#combobox").change(function(){
   
});
});
</script>
<style>
.custom-combobox {
position: relative;
display: inline-block;
}
.custom-combobox-toggle {
position: absolute;
top: 0;
bottom: 0;
margin-left: -1px;
padding: 0;
}
.custom-combobox-input {
margin: 0;
padding: 5px 10px;
}
</style>
<script type="text/javascript" language="javascript" class="init">    
     function totalHarga(){
        var harga=$("#harga").val();
        var jumlah=$("#jumlah").val();
        var total=harga*jumlah;
        $("#total").val(total);
        
    }

    function NilaiRupiah(jumlah) 
{ 
    var titik = ".";
    var nilai = new String(jumlah); 
    var pecah = []; 
    while(nilai.length > 3) 
    { 
        var asd = nilai.substr(nilai.length-3); 
        pecah.unshift(asd); 
        nilai = nilai.substr(0, nilai.length-3); 
    } 

    if(nilai.length > 0) { pecah.unshift(nilai); } 
    nilai = pecah.join(titik);
    return nilai; 
}

function kembali(){
  
    var totalBayar=$("#totalBayar").val();
    var bayar=$("#bayar").val();        
    var hitung=parseFloat(bayar)-parseFloat(totalBayar);
    if(isNaN(hitung)){
        alert("Masukkan Angka Yang benar");
        
    }
      else{  
           if(hitung<0){
               alert("Maaf Uang kurang ");
                   $("#kembali").val("");
                   $("#terbilang").html("");
           }
           else{
               alert("Kembalian : Rp."+NilaiRupiah(hitung));
               $("#kembali").val(hitung);
        $("#terbilang").html(terbilang(hitung));
           }
        
      }
}
    function totalBayar(){
        var x=0;
        var totalBeli=$("#totalBeli").val();
        var potongan=parseFloat($("#potongan").val())+parseInt(x);
        var kurang=parseFloat(totalBeli)-parseFloat(potongan);
         if(isNaN(kurang)){
             $("#totalBayar").val(0); 
             $("#potongan").val(0); 
         }else{
        $("#totalBayar").val(kurang); 
        //$("#bayar").focus();
        }
    }
    function print(){
        var kode=$("#print").val();   
        window.open('transaksi/barangKeluar/print.jsp?var=' + kode ,"mywindow","menubar=1,resizable=1,width=800,height=600");
    }
        $(document).ready(function () {

            $("#tombolPrint").click(function(){
                alert("ok");
                
            });
            $("#kode").attr("disabled","disabled");
            $("#tanggal").attr("disabled","disabled");
            $("#pembeli").attr("disabled","disabled");
            $("#combobox input").attr('disabled',true);
            $("#combobox button").attr('disabled',true);
            $("#satuan").attr("disabled","disabled");
            $("#harga").attr("disabled","disabled");
            $("#jumlah").attr("disabled","disabled");
            $("#total").attr("disabled","disabled");
            $("#potongan").attr("disabled","disabled");
            $("#bayar").attr("disabled","disabled");
            $("#totalBayar").attr("disabled","disabled");
            $("#kembali").attr("disabled","disabled");
            $("#simpan").attr("disabled","disabled");
            $("#button").attr("disabled","disabled");  
 $("#potongan").keyup(function(){
   totalBayar();
   });            
$("#simpan").click(function(){
    var tanggal=$("#tanggal").val();
    var pembeli=$("#pembeli").val();
    var bayar=$("#bayar").val();
    var totalBayar=$("#totalBayar").val();
    var kembali=$("#kembali").val();
        var oTable = $("#example").dataTable().fnGetData();
        var row=oTable.length;
        var detail = { "barang": "", "satuan": "", "jumlah": "","harga":"","total":"" };
        var keluar = { "tanggal": "", "pembeli": "", "row":"" ,"totalBeli":"","potongan":"","bayar":"","kembali":"", "details": []};
        keluar.tanggal=tanggal;
        keluar.pembeli = pembeli;
        keluar.totalBeli=$("#totalBeli").val();
        keluar.potongan=$("#potongan").val();
        keluar.bayar=bayar;
        keluar.kembali=$("#kembali").val();
        keluar.row=row;        
        for (var i = 0; i <oTable.length; i++) {
            detail.barang = oTable[i][0];
            detail.satuan = oTable[i][2];
            detail.jumlah = oTable[i][4];
            detail.harga  = oTable[i][5];
            detail.total  = oTable[i][6];
            keluar.details.push(detail);
            detail = {"barang": "", "satuan": "", "jumlah": "","harga":"","total":"" };            
        }
       var json = JSON.stringify(keluar);
       if(tanggal==""){
           
           alert("tanggal tidak boleh kosong !!");
           $("#tanggal").focus();
       }
       else if(totalBayar==0){
           alert("Barang masih kosong !!");
       }
       else if(bayar=="" || bayar==0){
            alert("Bayar tidak boleh kosong !!");
           $("#bayar").focus();
           
       }
       else if(parseInt(bayar)<parseInt(totalBayar)){
           alert("Uang pembayaran masih kurang !!");
           $("#bayar").focus();
       }
       else if(bayar!=totalBayar && kembali==0){           
           alert("kembalian masih kosong !!");
           $("#kembali").focus();
       }
       else if(parseInt(totalBayar)<0 || parseInt(totalBayar)==0){
           alert("Pembayaran Tidak boleh minus !!");
           $("#potongan").focus();
       }
       
       else{
       oTable = $("#example").dataTable().fnClearTable();       
        $("#pembeli").val("");
        $("#potongan").val("");
        $("#totalBayar").val("");
        $("#bayar").val("");
        $("#kembali").val("");
       $.ajax({
         url:"transaksi/barangKeluar/save.jsp",
         data: {data:json},
         success: function(data) {
              
            }
          
      });
    var thePopup = window.open( 'transaksi/barangKeluar/print.jsp', "Customer Listing", "scrollbars=1,menubar=0,location=0,height=auto,width=500" );
    $('#popup-content').clone().appendTo( thePopup.document.body );
    thePopup.print();
       }        
    
            });
 document.getElementById("tanggal").value = new Date().toJSON().slice(0,10);
   $('#harga').change(function(){
					console.log('Second change event...');
				});				
  $('#harga').number( true );
  
    $('#total').change(function(){
					console.log('Second change event...');
				});
				
	$('#total').number( true );  
          $('#potongan').change(function(){
					console.log('Second change event...');
				});
				
	$('#potongan').number( true );
     $('#totalBayar').change(function(){
					console.log('Second change event...');
				});
				
	$('#totalBayar').number( true ); 
        $('#jumlah').change(function(){
					console.log('Second change event...');
				});
				
	$('#jumlah').number( true ); 
          $('#bayar').change(function(){
					console.log('Second change event...');
				});
				
	$('#bayar').number( true ); 
          $('#kembali').change(function(){
					console.log('Second change event...');
				});
				
	$('#kembali').number( true ); 
 $("#baru").click(function(){
     $("#tanggal").focus();
     $("#info").html("");
           $("#simpan").removeAttr("disabled");
           $("#button").removeAttr("disabled");    
           $("#pembeli").removeAttr("disabled");
           $(".barang").removeAttr("disabled");
           $("#satuan").removeAttr("disabled");
           $("#harga").removeAttr("disabled");           
           $("#jumlah").removeAttr("disabled");
           $("#potongan").removeAttr("disabled");
           $("#totalBayar").removeAttr("disabled");
           $("#bayar").removeAttr("disabled");
           $("#kembali").removeAttr("disabled");
           $("#jumlah").removeAttr("disabled");
           $("#total").removeAttr("disabled");
           $("#print").removeAttr("disabled"); 
           $("#example").dataTable().fnClearTable();          
           $("#pembeli").val("");
           $("#potongan").val(0);
           $("#totalBayar").val("");
           $("#bayar").val("");
           $("#kembali").val("");
           $("#simpan").addClass('success');
        
          }); 
          
          
 $("#bayar").keyup(function(event){
    if(event.keyCode == 13 ){
      kembali();
    }
});  
$("#kembali").keyup(function(e){
    var key=e.which;
    if(key == 9){
     kembali();
     $("#bayar").focus();
    }
});
$('#jumlah').keypress(function (e) {
 var key = e.which;
 if(key == 13)  // the enter key code
  {
   add();
   cekRow()
  }
});  
$("#potongan").keyup(function(event){
    if(event.keyCode == 13){
     $("#totalBayar").focus();
     totalBayar();
    }
});  
var table = $('#example').DataTable({ "columnDefs": [ 
			{
				"targets": [ 0 ],
				"visible": false,
				"searchable": true
			},
            {
				"targets": [ 2 ],
				"visible": false,
				"searchable": true,
                                "bInfo": false,
                                  "bSort": false,
			},{ "sClass": "right", "aTargets": [ 6 ] }        
            ],
            
            "scrollY":"100px",
            "scrollCollapse": true,
            "bPaginate":false,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": false,
			"bInfo":false,
            "footerCallback": function ( row, data, start, end, display ) {
			var api = this.api(), data;
                        var intVal = function ( i ) {
			return typeof i === 'string' ?
			i.replace(/[\$,]/g, '')*1 :
			typeof i === 'number' ?
			i : 0;
			};
// Total over all pages
			data = api.column( 6 ).data();
			total = data.length ?
				data.reduce( function (a, b) {
				return intVal(a) + intVal(b);
				} ) :
				0;
			// Total over this page
			data = api.column( 6, { page: 'current'} ).data();
			pageTotal = data.length ?
				data.reduce( function (a, b) {
						return intVal(a) + intVal(b);
				} ) :
				0;
			// Update footer
			$( api.column( 6 ).footer() ).html(
				pageTotal
			);
                $("#totalBeli").val(pageTotal);
                $("#totalBayar").val(pageTotal);
		}    
    });

	$('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                    }
	} );
$('#button').click( function () {
	table.row('.selected').remove().draw( false );
      //  $("#potongan").val("");
       // $("#totalBayar").val("");
        //$("#bayar").val("");
        cekRow();
        totalBayar();
        $("#kembali").val(""); 
	} );
        
 $("#harga").mouseover(function(){
                var barang=$(".barang").val();
                var satuan=$("#satuan").val();
               $.ajax({
                   data:"barang="+barang+"&satuan="+satuan,
                   url:"transaksi/barangKeluar/cekHarga.jsp",
                   success:function(data){
                       $("#harga").val(parseFloat(data));                                
                   }
                   });
                });
          
              $("#jumlah").keyup(function(){
                var barang=$(".barang").val();
                var satuan=$("#satuan").val();              
                var harga=$("#harga").val();
                var jumlah=$("#jumlah").val();
                var hasil=harga*jumlah;
                $.ajax({
                    url:"transaksi/barangKeluar/cekStok.jsp",
                    data:"barang="+barang+"&satuan="+satuan+"&jumlah="+jumlah,
                    success:function(data){
                        if(data==0){
                            alert ("Qty tidak cukup");
                            $("#jumlah").val("");
                            $("#total").val("");
                            
                        }
                        else if(data==2){
                            
                            alert("Stok kosong");
                             $("#jumlah").val("");
                            $("#total").val("");
                        }
                        
                    }
                    
                });
                $("#total").val(hasil);               
                });
            
            $("#satuan").change(function(){
                
                $("#harga").val("");
                
            });     
 

 $("#barang").change(function(){
                 $("#harga").val("");
                  $("#satuan").html(""); 
                var barang=$("#barang").val();
                    $.ajax({
                    url:"transaksi/barangKeluar/cekSatuan.jsp",
                    data:"kode="+barang,
                    success:function(data){                         
                    $("#satuan").html(data);                        
                    }     
                });                
            });
    });
    function cekRow(){
             var rows = $('#mytbody').children('tr').length;
    $("#info").html("<h3>Jumlah Beli : &nbsp"+rows+"&nbsp;Item</h3>");
        
    }
     function add() {
 
        var barang= $(".barang").val();
        var satuan = $("#satuan").val();
        var jumlah = $("#jumlah").val();
        var harga = $("#harga").val();
        var total=$("#total").val();
        var namaBarang=$('select[name=barang] option:selected').text();
        var namaSatuan=$('select[name=satuan] option:selected').text();
         var oTable = $("#example").dataTable().fnGetData();
         var row=oTable.length;
         var detail = { "barang": ""};
         var keluar = {"details": []};
         for (var i = 0; i <oTable.length; i++) {
            detail.barang = oTable[i][1];
           keluar.details.push(detail);
         //   keluar.details.push(detail);
          //  detail = {"barang": "", "satuan": "", "jumlah": "","harga":"","total":"" };   
          detail = {"barang": "" };
        }
       var json = JSON.stringify(keluar);
         
       
        if(barang==".:Pilih:." || barang==null){
              alert("Pilih Barang dahulu");  
              $(".barang").focus();
        }
        else if(satuan==null){
            alert("Pilih Satuan dahulu");      
            $("#satuan").focus();
        }
        else if(harga=="" || harga==0){            
            alert("Harga belum diisi");
            $("#harga").focus();
        }
        else if(jumlah=="" || jumlah==0){
           alert("Jumlah belum diisi");
            $("#jumlah").focus();  
            
        }
        else{
            if(json.indexOf(namaBarang) !== -1) {
    alert("Maaf Barang yang di Pilih sudah ada di tabel !!");
}
else{
        $("#example").dataTable().fnAddData([barang,namaBarang,satuan,namaSatuan, jumlah,harga,total]); 
        $(".barang").val("");
        $(".barang").attr("value","h6511;73D71A62420B4A8431F3DF84098216AA");  
        $("#satuan").val("");
        $("#jumlah").val("");
        $("#harga").val("");
         $("#total").val("");
        $("#kembali").val("");
       
     } 
 }
     }
       function deleteRow(){
        var oTT = TableTools.fnGetInstance('tbl'); // Get Table instance
        var sRow = oTT.fnGetSelected(); // Get Selected Item From Table
        $('#ItemName').val($.trim(sRow[0].cells[0].innerHTML.toString()));
        $('#Qty').val(jQuery.trim(sRow[0].cells[1].innerHTML.toString()));
        $('#UnitPrice').val($.trim(sRow[0].cells[2].innerHTML.toString()));
        $('.table').dataTable().fnDeleteRow(sRow[0]);       
       
                }
</script>
 <style>
     .utama{
         float: right;
     }
     td.right {
  text-align: right;
}
     
 </style>
 
 <h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
               Transaksi Penjualan Barang
                </h3>
 <button class="open-dialog button info" id="baru">Transaksi Baru</button>&nbsp;<a href="?page=transaksi/barangKeluar/data"><button class="open-dialog" id="editData">View Data</button></a>
     
 <div class="example" style="background-color: none">

<div  class="span14">
    <table border="0" width="98%">
        <tr>
           
            <td>&nbsp;Pembeli</td>
    <td>:</td>
            <td><div class="input-control text">
        <input type="text" value="" placeholder="Pembeli" id="pembeli"/>
    <button class="btn-clear"></button>
    </div></td>
    <td>&nbsp</td>
    <td>&nbsp</td>
   
    <td>Tanggal</td>
    <td>:</td>
            <td><div class="input-control text"  >
                    <input type="text" id="tanggal" placeholder="Tanggal" readonly>

</div></td>

           
        </tr>
        
    </table>
         
  
        
             
 </div>
    
     <table class="table" >
              <tr>
                  <td><div class="input-control select" > 
                          <select id="combobox" class="barang" name="barang" style="min-width: 150px;min-height: 35px" >
                              <option></option>
                              <%
                            connect c=new connect();
String q="select * from barang";
ResultSet r=c.GetData(q);
while(r.next()){
                        out.print("<option value='"+r.getString("barang_id")+"'>"+r.getString("barang_nama")+"</option>");
}                %>
</select></div></td>
                     <td><div class="input-control select" >
                             <select id="satuan"  name="satuan" style="min-width:150px;">
                         
                     </select></div></td>
                     <td style="width: 150px"><div class="input-control text "><input type="text" placeholder="harga" id="harga" onkeyup="totalHarga()" ></div></td>
                     <td style="width: 120px"><div class="input-control text "><input type="text" placeholder="jumlah" id="jumlah" onkeyup="totalHarga()" ></div></td>
<td><div class="input-control text "><input type="text" placeholder="total" id="total" readonly></div></td>
<td>
    <img src="images/buy.png" onclick="add();cekRow()" title="Masukkan ke tabel belanja">&nbsp;&nbsp; <img src="images/remove.png" id="button"  title="Hapus baris tabel belanja" >
    </td>   
         </tr>
     </table>

     <table id="example" class="table bordered" >
    <thead>
        <tr>
            <th>Barang ID</th>
            <th>Barang</th>
            <th>Satuan ID</th>
            <th>Satuan</th>
            <th>Jumlah</th>
             <th>Harga</th>
             <th>Jumlah</th>
        </tr>
    </thead>
    <tbody id="mytbody"></tbody>
    <tfoot>
					<tr>
						<th colspan="6" style="text-align:right">Jumlah:</th>
						<th></th>
					</tr>
				</tfoot>
     </table>
<div id="info" style="float: left"></div>   
                     <div  class="span6 utama">
                          
             <input type="hidden"  id="totalBeli"  />
             
             
             
             <table  width="100%" border="0">
                 <tr>
                     <td width="25%">Potongan</td>
                     <td>:</td>
                     <td> <div class="input-control text">
                            <input type="text" value="0"  id="potongan"  onblur="totalBayar()" placeholder="Potongan" />
    <button class="btn-clear"></button>
         </div></td>
                 </tr>
                 
                  <tr>
                     <td>Jumlah Bayar</td>
                     <td>:</td>
                     <td>   <div class="input-control text">
                             <input type="text" value="" placeholder="Jumlah Bayar" id="totalBayar"   readonly onblur="totalBayar()"  class="read"/>
    <button class="btn-clear"></button>
         </div></td>
                 </tr>
                 
                 <tr>
                     <td>Bayar</td>
                     <td>:</td>
                     <td>  <div class="input-control text">
             <input type="text" value="" placeholder="Bayar" id="bayar" />
    <button class="btn-clear"></button>
         </div></td>
                 </tr>
                 <tr>
                     <td>Kembalian</td>
                     <td>:</td>
                     <td><div class="input-control text">
                             <input type="text" value="" placeholder="Kembali" id="kembali"   readonly onClick="kembali();" class="read"/>
    <button class="btn-clear"></button>
         </div></td>
                 </tr>
             </table>
   <div class="input-control text">
  <input type="button" value="Simpan" onclick="save()" class="button" id="simpan" width="100%"/> 
  
       </div>
                     </div>
                    
</div>

                   
                   </div>    
                   <script>
                       $(document).ready(function(){
                           $("#combobox").click(function(){
                               alert("ok");
                           });
                           
                       });
                       
                   </script>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   