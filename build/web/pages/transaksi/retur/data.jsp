<script type="text/javascript">
    $(document).ready(function(){
        $("#kode").keyup(function(event){
    if(event.keyCode == 13){
      var kode=$("#kode").val();
            $("#data").load("transaksi/retur/detailData.jsp?kode="+kode);
    }
}); 
        $("#cari").click(function(){
            var kode=$("#kode").val();
            $("#data").load("transaksi/retur/detailData.jsp?kode="+kode);
            
        });
        
    });
    
    
</script>
<h3>
                    <a ><i class="icon-arrow-right-3 fg-darker smaller"></i></a>
               Menu Retur Penjualan
                </h3>
<div class="example">
       <label>Kode Penjualan</label>
    <div class="input-control text"  >
                    <input type="text" id="kode" placeholder="Kode Penjualan">
<button class="btn-clear"></button>
</div>
    <button class="success" id="cari">Cari Data</button>
   
    
    
    <div id="data">
        
    </div>
</div>