<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
		
	Connection con;
	PreparedStatement ps;
	
 	try {
 		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udemy", "root", "root");
		ps = con.prepareStatement("select * from student where email = ? ");
		
		ps.setString(1, email);
		
		ResultSet rs = 	ps.executeQuery();
		/* String name=null; */
		
		if(rs.next())
		{	
			session.setAttribute("gEmail", email);
			String name = rs.getString(2);
			String emailDB = rs.getString(4);
			int roll = rs.getInt(1);
			int mark =  rs.getInt(3);
			String status = rs.getString(8);
			String password =  rs.getString(9);
			String usertype =  rs.getString(10);
			
			/* out.print(name); */
			
%>
<div class="container">
		<h1>Updating the Student Information of <%=email %> </h1>
	    <form method="post" action="updateDB.jsp" >
          <div class="mb-3">
              <label for="name" class="form-label">Name</label>
              <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name" placeholder="<%=name%>" />
          </div>
           <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" placeholder=" <%=emailDB %> " />
          </div>
           <div class="mb-3">
              <label for="roll" class="form-label">Roll no</label>
              <input type="number" class="form-control" id="roll" aria-describedby="emailHelp" name="roll" placeholder=" <%=roll %> "/>
          </div>
           <div class="mb-3">
              <label for="dob" class="form-label">DOB</label>
              <input type="date" class="form-control" id="dob" aria-describedby="emailHelp" name="dob"/>
          </div>
           <div class="mb-3">
             <label for="gender" class="form-label">Gender</label> <br>
             <input type="radio" name="gender" value="male" checked> Male 
             <input type="radio" name="gender" value="female" > Female 
             <input type="radio" name="gender" value="other" > Other 
          </div>
            <div class="mb-3">
              <label for="mark" class="form-label">Mark</label>
              <input type="number" class="form-control" id="mark" aria-describedby="emailHelp" name="mark" placeholder=" <%=mark %> "/>
          </div>

           <div class="mb-3">
              <label for="course" class="form-label">course</label>
              <select name="course">
              	<option>select</option>
              	<option>MCA</option>
              	<option>MBA</option>
              	<option>BTECH</option>
              	<option>MBBS</option>
              </select>
          </div>
          
          <div class="mb-3">
              <label for="status" class="form-label">Status</label>
              <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="status" placeholder="<%=status%>" />
          </div>
          <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input type="text" class="form-control" id="password" aria-describedby="emailHelp" name="password" placeholder="<%=password%>" />
          </div>
          <div class="mb-3">
              <label for="usertype" class="form-label">Usertype</label>
              <input type="text" class="form-control" id="usertype" aria-describedby="emailHelp" name="usertype" placeholder="<%=usertype%>" />
          </div>
          
          <input type="submit" value="update"/>
      </form>
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
</body>
</html>