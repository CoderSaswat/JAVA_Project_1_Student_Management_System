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
	String gEmail =(String) session.getAttribute("gEmail");
	Connection con;
	PreparedStatement ps1;
	int rollDB=0;
	String nameDB=null;
	int markDB=0;
	String emailDB=null;
	String dobDB=null;
	String genderDB=null;
	String branchDB=null;
	String statusDB=null;
	String passwordDB=null;
	String usertypeDB=null;


try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "root");
	ps1 = con.prepareStatement("select * from student where EMAIL  = ?");
	
	ps1.setString(1, gEmail);
	
	ResultSet rs2 = ps1.executeQuery();
	if(rs2.next()){
		rollDB = rs2.getInt(1);
		nameDB= rs2.getString(2);
		markDB = rs2.getInt(3);
		emailDB= rs2.getString(4);
		dobDB= rs2.getString(5);
		genderDB= rs2.getString(6);
		branchDB= rs2.getString(7);
		statusDB= rs2.getString(8);
		passwordDB= rs2.getString(9);
		usertypeDB= rs2.getString(10);
		/* System.out.print("hy"); */	
	}
			
} catch (SQLException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

%>

<%
	int roll;
	if(request.getParameter("roll") == ""){
		roll=rollDB;
	}
	else{
		roll = Integer.parseInt(request.getParameter("roll"));
	}

	String name;
	if(request.getParameter("name") == ""){
		name = nameDB;
	}
	else{
	name = request.getParameter("name");		
	}
	
	int mark;
	if(request.getParameter("mark") == ""){
		mark = markDB;
	}else{
	mark = Integer.parseInt(request.getParameter("mark"));		
	}
	
	String email;
	if(request.getParameter("email") == ""){
		email = emailDB;
	}
	else{
	email = request.getParameter("email");		
	}


	String dob = request.getParameter("dob");
	
	String gender;
	if(request.getParameter("gender") == ""){
		gender = genderDB;
	}
	else{
		gender = request.getParameter("gender");		
	}
	
	String course;
	if(request.getParameter("course").equals("select")){
		course = branchDB;
	}
	else{
		course = request.getParameter("course");		
	}
	
	String status;
	if(request.getParameter("status") == ""){
		status = statusDB;
	}
	else{
		status = request.getParameter("status");		
	}
	
	String password;
	if(request.getParameter("password") == ""){
		password = passwordDB;
	}
	else{
		password = request.getParameter("password");		
	}
	
	String usertype;
	if(request.getParameter("usertype") == ""){
		usertype = usertypeDB;
	}
	else{
		usertype = request.getParameter("usertype");		
	}
	

	
	 /* out.print(dob);  */
	
	PreparedStatement ps2;
	
 	try {
 		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "root");
		ps2 = con.prepareStatement("update student set ROLLNO = ?, NAME = ?, MARK = ?, EMAIL = ?, DOB=?, GENDER=?, BRANCH = ?, STATUS = ?, PASS = ?, USERTYPE = ? where EMAIL = ? ");
		
		ps2.setInt(1, roll);
		ps2.setString(2, name);
		ps2.setInt(3, mark);
		ps2.setString(4, email);
		ps2.setString(5, dob);
		ps2.setString(6, gender);
		ps2.setString(7, course);
		ps2.setString(8, status);
		ps2.setString(9, password);
		ps2.setString(10, usertype);
		
		ps2.setString(11, gEmail);
		
		int result = ps2.executeUpdate();
		if(result ==1){
			/* out.print("success"); */
%>	
		<div class="c1">
			<h1>Student Data Updated Succesfully</h1>
			<button> <a href="adminMenu.html" />Admin Menu</button>		
		</div>
<%			
		}
		else{
			out.print("failed");
		} 
		
 	} catch (SQLException e) {
		e.printStackTrace();
		out.print("sql exception");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		out.print("exception");
	} 
%>