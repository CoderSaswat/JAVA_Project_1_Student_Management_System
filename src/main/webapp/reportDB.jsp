<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
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

Connection con;
PreparedStatement ps;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "root");
	ps = con.prepareStatement("select * from student where USERTYPE = ?");
	ps.setString(1, "student");
	
	ResultSet rs = ps.executeQuery();	
%>
	<div class="c1">
		<h1>Student Information System</h1>
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
<%
			while(rs.next()){
%>
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
<%
		}
%>		
		</table>
		<br> <br>
		<button type="button" onClick="print()">Print Report</button>
		<br>
		<button> <a href="adminMenu.html" />Admin Menu</button>
	</div>		
<%
		
} catch (SQLException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

%>

<script type="text/javascript">
	function print(){
		alert("this page is being printed");
	}
</script>

</body>
</html>