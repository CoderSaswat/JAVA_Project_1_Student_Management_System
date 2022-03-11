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
	String password = request.getParameter("password");
	/* out.print(email); */
	
	Connection con;
	PreparedStatement ps;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "root");
		ps = con.prepareStatement("select * from student where EMAIL = ? and PASS = ?");
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		String type="";
		String name="";
		if(rs.next()){
			type = rs.getString("USERTYPE");
			name = rs.getString("NAME");
			/* out.print(type); */
		}
		else{
%>
		<div class="c1">
			<h1>Invalid Login Credentials</h1>
			<button> <a href="login.html" />try again</button>		
		</div>
<%
		}
		session.setAttribute("gName", name);
		
		if(type.equals("admin")){
			response.sendRedirect("adminMenu.html");
		}
		else if(type.equals("student")){
			RequestDispatcher rd = request.getRequestDispatcher("studentMenu.jsp");
			rd.forward(request, response);
			/* response.sendRedirect("studentMenu.jsp"); */
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
%>
