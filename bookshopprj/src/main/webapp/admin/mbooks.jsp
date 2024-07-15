<%@include file="header.jsp" %>
 <%@include file="ConnectionMaster.jsp"%> 
  <div class="container">
 <h1>Upload Book details Here</h1>
 Select an image to upload: <br />
 <form action="upload.jsp" method="post" enctype="multipart/form-data"> 
  <input type="file" name="file" size="50" />
 <br />
 <input type="submit" value="Upload" />
 </form>
 <form method=post class=form-vertical>
 <div class="form-group">
  <label for="nm">book no </label>
<input type="text" class="form-control" name="bookno" id="bn">
</div>

<div class="form-group">
<label for="ad">title</label>
<input type="text" class="form-control" name="title" id="tl">
</div>

<div class="form-group">
<label for="con">author</label>
<input type="text" class="form-control" name="author" id="auth">
</div>

<div class="form-group">
<label for="price">price</label>
<input type="text" class="form-control" name="price" id="pri">
</div>


<button type="submit" name="btnsub" class="btn btn-default">Submit</button>
<button type="reset" class="btn btn-default">Reset</button>

</form>

<h1 align=center>Our Books</h1> 
 <table class="table table-bordered">
 <thead>
 <tr>
  <th>Actions</th>
 <th>Book_no</th>
  <th>Title</th>
 <th>Author</th>
 <th>Price</th>
 <th>Image</th>
 
 </tr>
</thead>
<tbody>

<%


try{
	PreparedStatement pst=cn.prepareStatement("select * from books");
	ResultSet rs=pst.executeQuery();
	String bno="",t="",a="",p="",i="";
	while(rs.next())
		
	{
		bno=rs.getString("book_no");
	     t=rs.getString("title");
	     a=rs.getString("author");	
		p=rs.getString("price");
		i=rs.getString("image");
		
		%>
		
		<tr>
		<td>
		
		<a href='del.jsp?bookno=<%=bno %>' class="btn btn-danger btn-xs">Delete</a>
		 <a href='up.jsp?bookno=<%=bno %>' class="btn btn-info btn-xs">Update</a>
 </td>
<td><%=bno %></td> <td><%=t %></td><td><%=a %></td><td><%=p %></td>
<td><img src="../images/<%=i %>" width=100 height=100></td>

</tr>
<%
	}
	

}


catch(Exception ex)

{
	ex.printStackTrace();
	
	}

%>
	
	</tbody>
	 </table>
	
	 </div>
	 <%@include file="footer.jsp" %>

	<%
	if(request.getParameter("btnsub")!=null)
	{
	String bn, tl, auth, pri, im; 
	bn=request.getParameter("bookno");
    tl= request.getParameter("title"); 
    auth=request.getParameter("author"); 
    pri=request.getParameter("price");
	im=(String)session.getAttribute("filepath"); 
	
	
	PreparedStatement pst2=cn.prepareStatement("insert into books values(?,?,?,?,?)");
	
	pst2.setString(1,bn);
	pst2.setString(2,tl);
	pst2.setString(3,auth);
	pst2.setString(4,pri);
	pst2.setString(5,im);
	
	int ans=pst2.executeUpdate();
	if(ans!=0)
	{
		
		out.println("<script>alert('Data saved successfully')</script>");
	}
	else
	{
		out.println("<script>alert('Error Occured')</script>");
		
	}
	
}
	
	%>
