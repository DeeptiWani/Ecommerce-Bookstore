<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%! Connection cn=null; %>
<%
 try
 {
 Class.forName("com.mysql.cj.jdbc.Driver");
 cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/books", "root","root");
 }
 catch (Exception e)
{
e.printStackTrace();
}
 %>

 
 
 
 