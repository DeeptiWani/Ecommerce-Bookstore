<%@ include file="header.jsp"%>
<%@ include file="../ConnectionMaster.jsp"%>

<div class="container">
<h1>Place Order Here</h1>
<%
String bn="",t="",a="",p="",i="";
bn=request.getParameter("bookno");

try{
	PreparedStatement pst=cn.prepareStatement("select * from books where book_no=?");
	pst.setString(1, bn);
	ResultSet rs=pst.executeQuery();
	
	if(rs.next()){
		
		t=rs.getString("title");
		a=rs.getString("author");
		p=rs.getString("price");
		i=rs.getString("image");
		
	}
	
}catch(Exception ex){
	ex.printStackTrace();
}
%>

<img src="../images/<%=i %>" width=200 height=300>
<form>
<div class="form-group">
<label for="bn">Book No</label>
<input type="text" class="form-control" name="bn" id="bn" value="<%=bn %>" readonly>
</div>

<div class="form-group">
<label for="t">Title</label>
<input type="text" class="form-control" name="title" id="t" value="<%=t %>" readonly>
</div>

<div class="form-group">
<label for="a">Author</label>
<input type="text" class="form-control" name="author" id="a" value="<%=a %>" readonly>
</div>

<div class="form-group">
<label for="p">Price</label>
<input type="text" class="form-control" name="price" id="p" value="<%=p %>" readonly>
</div>

<div class="form-group">
<label for="qty">Quantity</label>
<input type="text" class="form-control" name="qty" id="qty">
</div>

<div class="form-group">
<label for="am">Amount</label>
<input type="text" class="form-control" name="am" id="am" onclick="cal()">


<script type="text/javascript">
function cal()
{
  var p,q,a;
  p=parseInt(document.getElementById("p").value)
  q=parseInt(document.getElementById("qty").value)
  a=p*q;
  document.getElementById("am").value=a

}
</script>

<button type="submit" name="butsub" id="butsub" class="btn btn-primary">Submit</button>
<button type="reset"  class="btn btn-danger">Reset</button>
</form>
</div>
</div>

<%@ include file="footer.jsp"%>

<%
if(request.getParameter("butsub")!=null){
	String em,bno,qn,am;
	em=(String)session.getAttribute("email");
	bno=request.getParameter("bn");
	qn=request.getParameter("qty");
	am=request.getParameter("am");
	
	try{
		
	PreparedStatement pst=cn.prepareStatement("insert into book_order values(?,?,?,?)");
	pst.setString(1, em);
	pst.setString(2, bno);
	pst.setString(3, qn);
	pst.setString(4, am);
	
	int ans=pst.executeUpdate();
	if(ans!=0){
		out.println("<script>alert('Order placed successfully');window.location='uindex.jsp'</script>");
	}
	else{
		out.println("<script>alert('Problem Occured')</script>");
	}
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
}
%>
<%@ include file="footer.jsp"%>