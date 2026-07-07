<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Dao.student_Dao,java.sql.Connection,student_classes.Data"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View.jsp</title>
<style>
	table,tr,td,th{
		border: 1px solid black;
		margin:0px;
	}
	th{
	background-color: #007f7f;
	color:white;
    padding: 14px 12px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 16px;
    font-weight: 600;
	}
	td{
	height:25px;
	}
	table{
	border-spacing: 0px;
	text-align: center;
		}
		body{
			display: flex;
			flex-direction: column;
			margin: 20px;
			
		
		}
		tr:nth-child(even) {
	background-color: lightblue;
}
.backform{
text-align: center;
}
#back-button{

width: 150px;
	height: 30px;
	border-radius: 5px;
	font-weight: bold;
	background-color:maroon;
	color:white;
}
#back-button:hover{
transition:0.5s;
	box-shadow:  5px 10px 15px rgba(0, 0, 0, 0.4);
	cursor: pointer;
	background-color: #5a001f
}
tr:hover{
background-color: lightblue;
}
	
</style>
</head>
<body>
	<% 
	ResultSet rs=null;
	try{
		Data ob1=(Data)application.getAttribute("Data");
		rs=ob1.rs;
	 %>
	<table>
	<tr><th>stud_id</th><th>stud_name</th><th>stud_department</th><th>stud_Email</th><th>stud_phno</th><th>stud_gender</th><th>stud_dob</th></tr>
	
		
		<%while(rs.next()){%>
		<tr>
		<td><%= rs.getInt("stud_id") %></td>
		<td><%= rs.getString("stud_name")%></td>
		<td><%= rs.getString("stud_department")%></td>
		<td><%=rs.getString("stud_Email") %></td>
		<td><%=rs.getString("stud_phno") %></td>
		<td><%=rs.getString("stud_gender") %></td>
		<td><%=rs.getDate("stud_dob") %></td>
		</tr>	
	<%}%>
	</table>
	
	<%}
	catch(SQLException e){
		System.out.println(e);
	}
	/*finally{
		try{
		if(rs!=null){
			rs.close();
		}
		}
		catch(SQLException e){
		System.out.println(e);
		}
	}*/%>
	<div class="backform">
	<form action="index.jsp">
	<h1 style="color:maroon;">go back to the home page!</h1>
		<input id="back-button" type="submit" value="back" >
	</form>
	</div>

</body>
</html>