<%@include file="header.jsp" %> 
<%@include file="ConnectionMaster.jsp"%>
<div class="container">
 <h1 align=center>Your Orders</h1> 
 <table class="table table-bordered">
   <thead>
<tr>
 <th>Book_no</th>
 <th>Quantity</th> 
 <th>Amount</th>

</tr>
</thead>
 <tbody>

<%

try
{
String bno="",email="", qty="", amt="";


PreparedStatement pst=cn.prepareStatement("select * from book_order");


ResultSet rs=pst.executeQuery();
while(rs.next())
{
bno=rs.getString("book_no");
email=rs.getString("email");
qty=rs.getString("qty");
amt=rs.getString("amount");

%>

<tr>
<td><%=bno %></td>
<td><%=qty %></td>
<td><%=amt %></td>
</tr>
<%

}
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>

</div>
</tbody>
</table>

<jsp:include page="footer.jsp"></jsp:include>

