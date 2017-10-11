<script>
    function printRetur(){
        var tanggal1=$("#tanggal5").val();
        var tanggal2=$("#tanggal6").val();
        if(tanggal1==""){
            alert("Tanggal Mulai tidak boleh kosong");
            
        }
        else if(tanggal2==""){
            alert("Tanggal Akhir tidak boleh kosong");
            
        }
        else{
    var thePopup = window.open( 'report/retur.jsp?tanggal1='+tanggal1+"&tanggal2="+tanggal2, "Customer Listing", "scrollbars=1,menubar=0,location=0,height=auto,width=740" );
    $('#popup-content').clone().appendTo( thePopup.document.body );
    thePopup.print();
        
    }
        
    }
    function printDetail(){
         var tanggal1=$("#tanggal3").val();
        var tanggal2=$("#tanggal4").val();
        if(tanggal1==""){
            alert("Tanggal Mulai tidak boleh kosong");
            
        }
        else if(tanggal2==""){
            alert("Tanggal Akhir tidak boleh kosong");
            
        }
        else{
    var thePopup = window.open( 'report/penjualanDetail.jsp?tanggal1='+tanggal1+"&tanggal2="+tanggal2, "Customer Listing", "scrollbars=1,menubar=0,location=0,height=auto,width=540" );
    $('#popup-content').clone().appendTo( thePopup.document.body );
    thePopup.print();
        
    }
        
    }
    function kosong1(){
        $("#tanggal1").val("");
        $("#tanggal2").val("");
        
        
    }
    function kosong2(){
        $("#tanggal3").val("");
        $("#tanggal4").val("");
        
        
    }
    
    function kosong3(){
        $("#tanggal5").val("");
        $("#tanggal6").val("");
        
    }
    function printUntung(){
      var tanggal7=$("#tanggal7").val();
      var tanggal8=$("#tanggal8").val();
      document.location='admin.jsp?page=report/keuntunganPenjualan&tanggal1='+tanggal7+"&tanggal2="+tanggal8;
    }
    function print(){
        var tanggal1=$("#tanggal1").val();
        var tanggal2=$("#tanggal2").val();
        if(tanggal1==""){
            alert("Tanggal Mulai tidak boleh kosong");
            
        }
        else if(tanggal2==""){
            alert("Tanggal Akhir tidak boleh kosong");
            
        }
        else{
    var thePopup = window.open( 'report/reportPenjualan.jsp?tanggal1='+tanggal1+"&tanggal2="+tanggal2, "Customer Listing", "scrollbars=1,menubar=0,location=0,height=auto,width=540" );
    $('#popup-content').clone().appendTo( thePopup.document.body );
    thePopup.print();
        
    }
}
  
</script>
<h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
            Menu Laporan
                </h3>

    
</h3><div class="example">
   
      <div class="accordion with-marker span4 place-left margin10" data-role="accordion" data-closeany="false">
                                    <div class="accordion-frame">
                                        <a class="heading bg-lightBlue fg-white" href="#" onclick="kosong1()">Penjualan All</a>
                                        <div class="content">
                                            <table width="90%"><tr>
                                                    <td>Mulai</td>
                                                    <td>:</td>
                                                    <td><div class="input-control text" data-role="datepicker" data-format="yyyy-mm-dd" data-position="top|bottom" data-effect="none|slide|fade" >
                                                            <input type="text" id="tanggal1" placeholder="Tanggal">
                                                            <button class="btn-date"></button></div>
                                                    </td></tr><tr>
                                                    <td>Sampai</td><td>:</td><td>
                                                        <div class="input-control text" data-role="datepicker" data-format="yyyy-mm-dd" data-position="top|bottom" data-effect="none|slide|fade" >
                                                            <input type="text" id="tanggal2" placeholder="Tanggal">
                                                            <button class="btn-date"></button></div>
                                                    </td></tr>
                                            </table></br><table align="center"><tr><td><img src="./images/printData.png" onclick="print()" width="50"></td></tr></table>
                                        </div>
                                    </div>
                                    <div class="accordion-frame">
                                        <a class="heading bg-lightBlue fg-white" href="#" onclick="kosong2()">Penjualan Detail</a>
                                        <div class="content">
                                            <table width="90%">
                                                <tr><td>Mulai</td><td>:</td>
                                                    <td><div class="input-control text" data-role="datepicker" data-format="yyyy-mm-dd" data-position="top|bottom" data-effect="none|slide|fade" >
                                                            <input type="text" id="tanggal3" placeholder="Tanggal">
                                                            <button class="btn-date"></button></div></td>
                                                </tr>
                                                 <tr><td>Sampai</td><td>:</td><td>
                                                         <div class="input-control text" data-role="datepicker" data-format="yyyy-mm-dd" data-position="top|bottom" data-effect="none|slide|fade" ><input type="text" id="tanggal4" placeholder="Tanggal"><button class="btn-date"></button></div>
                                                     </td></tr>
                                                 </table><br><table align="center"><tr><td><img src="./images/printData.png" onclick="printDetail()" width="50"></td></tr></table>
                                        </div>
                                    </div>
                                 
                                </div>
    <div class="accordion with-marker span4 place-left margin10" data-role="accordion" data-closeany="false">
                                    <div class="accordion-frame">
                                        <a class="heading  bg-lightBlue fg-white" onclick="kosong3()">Retur Barang</a>
                                        <div class="content">
                                           <table width="90%">
                                                <tr><td>Mulai</td><td>:</td>
                                                    <td><div class="input-control text" data-role="datepicker" data-format="yyyy-mm-dd" data-position="top|bottom" data-effect="none|slide|fade" >
                                                            <input type="text" id="tanggal5" placeholder="Tanggal">
                                                            <button class="btn-date"></button></div></td>
                                                </tr>
                                                 <tr><td>Sampai</td><td>:</td><td>
                                                         <div class="input-control text" data-role="datepicker" data-format="yyyy-mm-dd" data-position="top|bottom" data-effect="none|slide|fade" ><input type="text" id="tanggal6" placeholder="Tanggal"><button class="btn-date"></button></div>
                                                     </td></tr>
                                                 </table><br><table align="center"><tr><td><img src="./images/printData.png" onclick="printRetur()" width="50"></td></tr></table>
                                        </div>
                                    </div>
                                 <div class="accordion-frame">
                                        <a class="heading  bg-lightBlue fg-white">Keuntungan Penjualan</a>
                                        <div class="content">
                                           <table width="90%">
                                                <tr><td>Mulai</td><td>:</td>
                                                    <td><div class="input-control text" data-role="datepicker" data-format="yyyy-mm-dd" data-position="top|bottom" data-effect="none|slide|fade" >
                                                            <input type="text" id="tanggal7" placeholder="Tanggal">
                                                            <button class="btn-date"></button></div></td>
                                                </tr>
                                                 <tr><td>Sampai</td><td>:</td><td>
                                                         <div class="input-control text" data-role="datepicker" data-format="yyyy-mm-dd" data-position="top|bottom" data-effect="none|slide|fade" ><input type="text" id="tanggal8" placeholder="Tanggal"><button class="btn-date"></button></div>
                                                     </td></tr>
                                                 </table><br><table align="center"><tr><td><img src="./images/printData.png" onclick="printUntung()" width="50"></td></tr></table>
                                        </div>
                                    </div>
                                 
                                   
                                </div>
    <div class="span8" style="margin: auto">
   
     
  
        
     
     
</div>
</div>
 