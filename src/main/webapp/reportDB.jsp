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
	.c2{
	background-color: #78fe17;
	color: red;
	}	
	.c3{
    background-color: #b4fffe;
    color: #0a07d4;
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
			<tr class="c2">
				<th>ROLL NO</th>
				<th>NAME</th>
				<th>MARK</th>
				<th>EMAIL</th>
				<th>DOB</th>
				<th>GENDER</th>
				<th>COURSE</th>
				<th>STATUS</th>
			</tr>
<%
			while(rs.next()){
%>
			<tr class="c3">
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