

<%@ include file="header.jsp"%>
<%@ include file="../ConnectionMaster.jsp"%>



<div class="container">
<h1 align=center style="color:black">Books to Order</h1>
<div class="row">
<%
try{
	PreparedStatement pst=cn.prepareStatement("select * from books");
	ResultSet rs=pst.executeQuery();
	String bn,t,a,p,i;
	int cnt=0;
	while(rs.next()){
		
	    cnt++;
	bn=rs.getString("book_no");
	t=rs.getString("title");
	a=rs.getString("author");
	p=rs.getString("price");
	i=rs.getString("image");
	%>

	<div class="col-md-3">
	<div class="thumbnail">
	<a href="../images/<%=i %>" target="_blank">
	<img src="../images/<%=i %>" class="img-responsive">
	<div class="caption">
	Title: <strong><%=t %></strong><br>
	Author: <b><%=a %></b><br>
	Price: <big><%=p %></big>
	<br><a href="placeorder.jsp?bookno=<%=bn %>" class="btn btn-primary">Buy Now</a>
	</div>
	</a>
	</div>
	</div>

	<%
	}
	
}catch(Exception ex){
	ex.printStackTrace();
}
%>
</div>
<%@ include file="footer.jsp"%>