<!DOCTYPE html>
<%
    if ((session.getAttribute("id") == null) || (session.getAttribute("id") =="")) {
response.sendRedirect("./");

%>


<%}
    Cookie[]user_cokie=request.getCookies();
//out.print(user_cokie[0].getValue());

%>
<html>
<head>
    <meta http-equiv="refresh" content="1200">
    <link href="css/dataTables.tableTools.css" rel="stylesheet">
    <link href="css/metro-bootstrap.css" rel="stylesheet">
    <link href="css/metro-bootstrap-responsive.css" rel="stylesheet">
    <link href="css/iconFont.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
    <link href="js/prettify/prettify.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery/jquery.widget.min.js"></script>
    <script src="js/jquery/jquery.mousewheel.js"></script>
    <script src="js/prettify/prettify.js"></script>
    <script src="js/hitua.js"></script>
    <script src="js/load-metro.js"></script>
    <script src="js/docs.js"></script>
    <script src="js/github.info.js"></script>
    <script src="js/jquery.dataTables.js"></script>
    <script src="js/global.js"></script>
    <script src="js/dataTables.tableTools.js"></script>
    <script src="js/jquery.number.js" type="text/javascript"></script>
    <script src="js/jquery-ui-messageBox.js"></script>
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-ui.js" type="text/javascript"></script>

    <title>Toko Lautan-Cibinong</title>
    <style>
        #footer {
   position: fixed;
      Width: 100%;
      Bottom: 0;
      Height: 35px;  /* This value is the height of your footer */
    background-color: #EEE;
border-collapse: collapse;
box-sizing: border-box;
color: #555;
display: block;
font-family: "Segoe UI_","Open Sans",Verdana,Arial,Helvetica,sans-serif;
font-size: 15.6833px;
font-style: normal;

}
    </style>
</head>
<body class="metro">
    <header class="bg-dark" data-load="header.jsp"></header>

    <div class="container">
        <%
String pages="page";
String requestURL = request.getRequestURL().toString();
String queryString = request.getParameter(pages);
if (queryString != null) {requestURL += "?" + queryString;
String g=".jsp";
String c=queryString + g;
        %>
           <%pageContext.include(c); %>
        <% }
else {
        %>
        <%@include file="home.jsp" %>
        <% } %>
          
          </div>

        <div class="page-footer">
            <div class="page-footer-content">
                <!--<div data-load="header.html"></div>-->
            </div>
        </div>
  
 
     

</body>
</html>