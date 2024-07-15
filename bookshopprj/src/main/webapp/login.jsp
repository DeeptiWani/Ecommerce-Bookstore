<%@ include file="header.jsp" %>
<%@ include file="ConnectionMaster.jsp" %>

<div class="container">
<h1>Login Here</h1>
<form method="post" class="form-vertical">

<div class="form-group">
<label for="em">Email Id</label>
<input type="text" class="form-control" name="email" id="em">
</div>

<div class="form-group">
<label for="pwd">Password</label>
<input type="password" class="form-control" name="password" id="pwd">
</div>
<button type="submit" name="btnsub" class="btn btn-primary">Submit</button>
</form>
</div>
<%@ include file="footer.jsp" %>

<%
if(request.getParameter("btnsub")!=null){
	String eml,pass;
	eml=request.getParameter("email");
	pass=request.getParameter("password");
	
	try{
		PreparedStatement pst=cn.prepareStatement("select * from register where email=? and password=?");
		pst.setString(1,eml);
		pst.setString(2, pass);
		ResultSet rs=pst.executeQuery();
		if(rs.next()){
			
			session.setAttribute("email", eml);
			response.sendRedirect("user/uindex.jsp");
		}
		else{
			out.println("<font color=red><center>Invalid username or password</center></font>");
		}
		
	}catch(Exception e1){
		e1.printStackTrace();
	}
	 
}

%>