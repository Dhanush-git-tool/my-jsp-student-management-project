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
	padding{
	
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
	<form action="index.jsp">
	<h1 style="color:maroon;">go back to the home page!</h1>
		<input type="submit" value="back" style="color: maroon;">
	</form>

</body>
</html>