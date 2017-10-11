<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<table>
          <%
connect c=new connect();
String query="select distinct(barang_id) from jumlah";
ResultSet rs=c.GetData(query);

while (rs.next())
{
          
           String kode=rs.getString("barang_id");%>
   <tr>
        <td>
           <% out.print(kode);%> 
        </td>
        <td>
         <%
         String det="select jumlah.*,satuan.satuan_nama from jumlah join satuan on jumlah.satuan_id=satuan.satuan_id where jumlah.barang_id='"+kode+"' ";
ResultSet rst=c.GetData(det);
while(rst.next()){
    out.print(rst.getString("jumlah_jumlah")+"&nbsp;"+rst.getString("satuan_nama"));

}
         %>   
        </td>
    </tr>

    

<%}
%> 
    
    
</table>