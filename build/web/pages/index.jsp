<%
    //Cookie[]user_cokie=request.getCookies();
//out.print(user_cokie[0].getValue());

%>
<!DOCTYPE html>
<html>
<head>
 
    <link href="css/metro-bootstrap.css" rel="stylesheet">
    <link href="css/metro-bootstrap-responsive.css" rel="stylesheet">
    <link href="css/iconFont.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/jquery/jquery.widget.min.js"></script>  
    <script src="js/load-metro.js"></script>

    <style>
.symbol {
    font-size: 0.9em;
    font-family: Times New Roman;
    border-radius: 1em;
    padding: .1em .6em .1em .6em;
    font-weight: bolder;
    color: white;
    background-color: #3229CF;
}

.icon-info { background-color: #3229CF; }
.icon-error { background: #e64943; font-family: Consolas; }
.icon-tick { background: #13c823; }
.icon-excl { background: #ffd54b; color: black; }
.icon-info:before { content: 'i'; }
.icon-error:before { content: 'x'; }
.icon-tick:before { content: '\002713'; }
.icon-excl:before { content: '!'; }

.notify {
    background-color:#e3f7fc; 
    color:#555; 
    border:.1em solid;
    border-color: #8ed9f6;
    border-radius:10px;
    font-family:Tahoma,Geneva,Arial,sans-serif;
    font-size:1.1em;
    padding:10px 10px 10px 10px;
    margin:10px;
    cursor: default;
}

.notify-yellow { background: #fff8c4; border-color: #f7deae; }
.notify-red { background: #ffecec; border-color: #fad9d7; }
.notify-green { background: #e9ffd9; border-color: #D1FAB6; }
#footer {
      Position: absolute;
      Width: 100%;
      Bottom: 0;
      Height: 35px;  /* This value is the height of your footer */
     background-image: url(images/bg_pattern.png);
}

</style>
    
    <script type="text/javascript">
        
        $(document).ready(function(){
           
            $.ajax({
                url:"cekCaptcha1.jsp",
                success:function(data){
                    
                    $("#nilai1").val(data);
                }
                
            });
             $.ajax({
                url:"cekCaptcha2.jsp",
                success:function(data){
                    
                    $("#nilai2").val(data);
                }
                
            });
            $("#username").focus();
            $("#username").click(function(){
                $("#warn").html("");                
            });
            $("#password").click(function(){
                 $("#warn").html("");                
            });
            $("#reset").click(function(){
                $("#username").val("");
                $("#password").val("");                
            });
      $("#login").click(function(){               	
              var nilai1=$("#nilai1").val();
              var nilai2=$("#nilai2").val();
              var hasil=$("#hasil").val();
              var tambah=parseInt(nilai1)+parseInt(nilai2);
              
              var username=$("#username").val();
              var password=$("#password").val();
              if((username=="") && (password=="")){
                  $("#warn").html("<br>     <div class='notify notify-yellow'><span class='symbol icon-excl'></span>&nbsp;Maaf Username dan password tidak boleh kosong</div>");
                   }
             else if(username==""){
                 $("#warn").html("<br>     <div class='notify notify-yellow'><span class='symbol icon-excl'></span>&nbsp;Maaf Username tidak boleh kosong</div>");
                  
              }
              else if(password==""){
                  $("#warn").html("<br>     <div class='notify notify-yellow'><span class='symbol icon-excl'></span>&nbsp;Maaf Password tidak boleh kosong</div>");
                  
              } 
              else if(hasil==""){
                   $("#warn").html("<br>     <div class='notify notify-yellow'><span class='symbol icon-excl'></span>&nbsp;Isi captcha dulu</div>");
                  $("#hasil").focus();
              }
              else if(hasil!=tambah){
                  $("#hasil").val("");
                     $.ajax({
                url:"cekCaptcha1.jsp",
                success:function(data){
                    
                    $("#nilai1").val(data);
                }
                
            });
             $.ajax({
                url:"cekCaptcha2.jsp",
                success:function(data){
                    
                    $("#nilai2").val(data);
                }
                
            });
                     $("#warn").html("<br>     <div class='notify notify-yellow'><span class='symbol icon-excl'></span>&nbsp;Maaf captcha salah</div>");
                  $("#hasil").focus();
              }
              else{
                    $("#nilai1").val("");
                    $("#nilai2").val("");
                              $.ajax({
                  data:"username="+username+"&password="+password,
                  url:"cekLogin.jsp",
                  success:function(data){
                     if(parseFloat(data)==1){
                        
                   document.location='admin.jsp';
                     }
                     else{
                        $("#warn").html("<br>     <div class='notify notify-red'><span class='symbol icon-excl'></span>&nbsp;Maaf Username atau password Anda Salah</div>");
                         
                         
                     }
                      
                  }
                  
              });
                              
                              
                          }
                                      
                 
                
            });
            
        });
        
    </script>
    
    
</head>
<body class="metro">
   <div class="navigation-bar light">
    <div class="navigation-bar-content container">
        <img src="images/foto.png" width="170">
   
    </div>
</div>
    <br>

     
    <div class="container">
        
         <div class="example" >
             
                                <form>
                                    <fieldset>
                                        
                                        <legend>Login Menu</legend>

                                        <label>User Name</label>
                                        <div class="input-control text" data-role="input-control">
                                            <input type="text" placeholder="Username" id="username">
                                            <button class="btn-clear" tabindex="-1"></button>
                                        </div>
                                        <label>Password</label>
                                        <div class="input-control password" data-role="input-control">
                                            <input type="password" placeholder="Password" autofocus id="password">
                                            <button class="btn-reveal" tabindex="-1"></button>
                                        </div>                                      
                                        <%
										/*
	ReCaptcha c = ReCaptchaFactory.newReCaptcha(
       		  	"6LdlHOsSAAAAAM8ypy8W2KXvgMtY2dFsiQT3HVq-", 
        		"6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY", false);
	out.print(c.createRecaptchaHtml(null, null));*/
%>
                                       
<input type="text" id="nilai1" size="4"  readonly/>+<input type="text" id="nilai2" size="4"  readonly/>=<input type="text" id="hasil" size="4"  maxlength="3" />
  </fieldset>
                                </form>
             <input type="submit" value="Login" id="login" class="button primary">&nbsp;<input type="submit" value="Reset" id="reset" class="button default">
               
                            </div>
  
              <div id="warn">
       
            
        </div>
          </div>

   


          
</body>
</html>