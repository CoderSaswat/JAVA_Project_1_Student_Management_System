<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student menu</title>
<style>
	.c1{
	display : flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	}
</style>
</head>
<body>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
/* out.print(email);
out.print(password); */

Connection con;
PreparedStatement ps;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "root");
	ps = con.prepareStatement("select * from student where EMAIL = ? and PASS = ?");
	ps.setString(1, email);
	ps.setString(2, password);
	String gName =(String) session.getAttribute("gName");
	
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
%>
	<h2>Welcome : <%=gName %></h2>
	<div class="c1">
		<h2>Your full details</h2>
		<table align="center" cellpadding="5" cellspacing="5" border="1">
			<tr>
				<th>roll no</th>
				<th>name</th>
				<th>mark</th>
				<th>email</th>
				<th>dob</th>
				<th>gender</th>
				<th>coures</th>
				<th>status</th>
			</tr>
			<br>
			<tr>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getInt(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=rs.getString(8) %></td>
			</tr>
		
		</table> <br> <br>
		<button><a href="login.html">Logout</a></button>
	</div>
		
<%
	}	
	
} catch (SQLException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

%>
</body>
</html>