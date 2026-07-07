<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="student_classes.*,java.sql.Connection" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Female-students.jsp</title>
</head>
<style>
table,tr,td,th{
		border: 1px solid black;
		margin:0px;
	}
	th{
      background-color: #EC4899;
    color: white;
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
	  background-color: #FCE7F3;
}
.backform{
text-align: center;
}
h1{
margin: 0px;
font-family: "Trebuchet MS", Arial, sans-serif;
    font-size: 38px;
    font-weight: 700;
    color:  black;
    text-align: center;
    letter-spacing: 1px;
}
tr:hover{
background-color: lightpink;
}
</style>
<body>
<h1>Female Students List</h1>
<%ResultSet rs=null;
	Data ob1= (Data)application.getAttribute("Data");
	rs=ob1.female_cards();
%>
<table>
	<tr><th>stud_id</th><th>stud_name</th><th>stud_department</th><th>stud_Email</th><th>stud_phno</th><th>stud_gender</th><th>stud_dob</th></tr>
	<%while(rs.next()){ %>
	<tr><td><%=rs.getInt("stud_id")%></td>
	<td><%=rs.getString("stud_name")%></td>
	<td><%=rs.getString("stud_department") %></td>
	<td><%=rs.getString("stud_Email") %></td>
	<td><%=rs.getString("stud_phno") %></td>
	<td><%=rs.getString("stud_gender") %></td>
	<td><%=rs.getDate("stud_dob") %></td>
	</tr>
	<%}%>
</body>
</html>