<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>

<style>
	.c1{
	display : flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	}
</style>

<%
String email = request.getParameter("email");
Connection con;
PreparedStatement ps;

	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "root");
	ps = con.prepareStatement("delete from student where email = ?");
	ps.setString(1, email);
	
	int result = ps.executeUpdate();
	if(result ==1){
		/* out.print("success"); */
%>
		<div class="c1">
			<h1>Student Data Deleted Succesfully</h1>
			<button> <a href="adminMenu.html" />Admin Menu</button>		
		</div>
<%			
	}
	else{
%>		
		<div class="c1">
			<h1>404 : Student not found please try again !!!</h1>
			<button> <a href="adminMenu.html" />Admin Menu</button>		
		</div>
<%		
	} 
	
	} catch (SQLException e) {
	e.printStackTrace();
	out.print("exception");
} catch (ClassNotFoundException e) {
	e.printStackTrace();
	out.print("exception");
}
%>