<%@include file="header.jsp" %> 
<%@include file="ConnectionMaster.jsp"%>
<%
String bno = request.getParameter("bookno");
session.setAttribute("bno", bno); 
String t = "", a = "", p = "", i = "";
PreparedStatement pst = cn.prepareStatement("select * from books where book_no=?"); 
pst.setString(1, bno); 
ResultSet rs = pst.executeQuery();
if (rs.next()) {
    t = rs.getString("title"); 
    a = rs.getString("author");
    p = rs.getString("price");
    i = rs.getString("image");
}
%>

<div class="container">
    <h1>Upload Book details Here</h1>
    <form action="upload1.jsp" method="post" enctype="multipart/form-data">
        <img src="../images/<%=i %>" width="100" height="100"><br>
        Select an image to change: <br />
        <input type="file" name="file" size="50" />
        <br />
        <input type="submit" value="Upload" />
    </form>
    
    <form method="post" class="form-vertical"> 
        <div class="form-group">
            <label for="bookno">Book No</label>
            <input type="text" class="form-control" name="bookno" id="bn" value="<%=bno %>">
        </div>

        <div class="form-group"> 
            <label for="title">Title</label>
            <input type="text" class="form-control" name="title" id="tl" value="<%=t%>">
        </div>

        <div class="form-group">
            <label for="author">Author</label> 
            <input type="text" class="form-control" name="author" id="auth" value="<%=a %>">
        </div>

        <div class="form-group">
            <label for="price">Price</label> 
            <input type="text" class="form-control" name="price" id="pri" value="<%=p %>">
        </div>

        <button type="submit" name="butsub" id="butsub" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-danger">Reset</button>
    </form>
</div>

<%@include file="footer.jsp" %>

<%
if (request.getParameter("butsub") != null) { // Change "btnsub" to "butsub"
    String bn, tl, auth, pri, im;
    bn = request.getParameter("bookno");
    tl = request.getParameter("title");
    auth = request.getParameter("author");
    pri = request.getParameter("price"); 
    im = (String) session.getAttribute("filepath");
    if (im == null) {
        im = i;
    }
    PreparedStatement pst3 = cn.prepareStatement("update books set title=?, author=?, price=?, image=? where book_no=?");
    pst3.setString(1, tl); 
    pst3.setString(2, auth);
    pst3.setString(3, pri);
    pst3.setString(4, im);
    pst3.setString(5, bn);

    int ans = pst3.executeUpdate(); 
    if (ans != 0) {
        out.println("<script>alert('Data saved successfully')</script>");
    } else {
        out.println("<script>alert('Error Occurred')</script>");
    }
}
%>
