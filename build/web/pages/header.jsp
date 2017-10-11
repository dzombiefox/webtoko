<script>
    function move(){
        document.location='admin.jsp';
        
    }
    $(document).ready(function(){
        var lev=$("#level").val();
        if(lev=="user"){
            $("#user").html("");
            $("#stok").html(""); 
        }
        
    });
    
</script>
<div class="navigation-bar light">
    <div class="navigation-bar-content container">
   
        <span class="element-divider"></span>
        <a class="element1 pull-menu" href="#"></a>
        <ul class="element-menu">
            <li>
               
                   
            <li>  <img src="images/foto.png" width="155" onclick="move()"></li>
                  
                  
               
            </li>
            <li>
                <a class="dropdown-toggle" href="#">Master</a>
                
                <ul class="dropdown-menu light" data-role="dropdown">
                    <li><a href="?page=master/barang/data">Barang</a></li>
                  <li class="divider"></li>
                    <li><a href="?page=master/satuan/data">Satuan Jumlah</a></li>
                   
                    <li class="divider"></li>
                    <li><a href="?page=master/harga/data">Harga</a></li>
                    <li class="divider"></li>
                    <li><a href="?page=master/suplier/data">Suplier</a></li>
                    <div id="user">
                    <li class="divider" ></li>
                    <li> <a href="?page=master/user/data">User</a></li>
                    </div>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle"  href="#">Transaksi</a>
                <ul class="dropdown-menu light" data-role="dropdown">
                    <li><a href="?page=transaksi/barangMasuk/data">Barang Masuk</a></li>
                    <li class="divider"></li>
                     <li><a href="?page=transaksi/barangKeluar/create">Penjualan Barang</a></li>
                     <li class="divider"></li>
                    <li><a href="?page=opname/data">Perubahan Stok</a></li> 
                    <li class="divider"></li>
                    <li><a href="?page=transaksi/retur/data">Retur Barang</a></li> 
                </ul>
            </li>
            <li>
                <a href="#" class="dropdown-toggle">Data</a>
                <ul class="dropdown-menu light" data-role="dropdown">
                    <li><a href="?page=transaksi/barangMasuk/dataAll">Data Barang Masuk</a></li>
                    <li class="divider"></li>
                    <li><a href="?page=transaksi/barangKeluar/data">Data Barang Keluar</a></li>
                       <li class="divider"></li>
                    <li><a href="?page=opname/reportStok">Stok Barang</a></li> 
                    <div id="stok">
                     <li class="divider"></li>
                    <li><a href="?page=ubahStok/data">Perubahan Stok</a></li>
                     <li class="divider"></li>
                    <li><a href="?page=transaksi/retur/dataRetur">Data Retur Barang</a></li> 
                    </div>
                </ul>
            </li>
            <li>
               
                   
                    <li><a href="?page=report/index">Laporan</a></li>
                  
                  
               
            </li>
       
        </ul>

        <div class="no-tablet-portrait no-phone">
            <a href="logout.jsp" class="element place-right"><span class="icon-exit">Keluar</span></a>
            
      
            <!--<span class="element-divider place-right"></span>-->
            <!--<div class="element place-right" title="GitHub Forks"><span class="icon-share-2"></span> <span class="github-forks">0</span></div>-->
        </div>
    </div>
</div>
<% out.print("<input type='hidden' value='"+session.getAttribute("level")+"' id='level'>"); %>