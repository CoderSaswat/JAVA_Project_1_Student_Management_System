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
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String dob = request.getParameter("dob");
	String gender = request.getParameter("gender");
	int mark = Integer.parseInt(request.getParameter("mark"));
	String course = request.getParameter("course");
	int roll = Integer.parseInt(request.getParameter("roll"));
	 /* out.print(dob);  */
	
	Connection con;
	PreparedStatement ps;
	
 	try {
 		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "root");
		ps = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?)");
		
		ps.setInt(1, roll);
		ps.setString(2, name);
		ps.setInt(3, mark);
		ps.setString(4, email);
		ps.setString(5, dob);
		ps.setString(6, gender);
		ps.setString(7, course);
		ps.setString(8, "enrolled");
		ps.setString(9, "123");
		ps.setString(10, "student");
		
		int result = ps.executeUpdate();
		if(result ==1){
			/* out.print("success"); */
%>	
		<div class="c1">
			<h1>Student Data Inserted Succesfully</h1>
			<button> <a href="adminMenu.html" />Admin Menu</button>		
		</div>
<%			
		}
		else{
			out.print("failed");
		} 
		
 	} catch (SQLException e) {
		e.printStackTrace();
		out.print("exception");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		out.print("exception");
	} 


%>