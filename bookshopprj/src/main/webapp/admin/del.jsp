<%@include file="ConnectionMaster.jsp"%>
<% 
try
 {
 String bno=request.getParameter("bookno");
 PreparedStatement pst=cn.prepareStatement("delete from books where book_no=?");
pst.setString(1, bno);
pst.executeUpdate();

out.println("<script>alert('Record deleted');window.location='index.jsp'</script>");
 }
 catch (Exception ex)
 {
 ex.printStackTrace();
}
 %>