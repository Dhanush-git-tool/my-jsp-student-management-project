<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="student_classes.*" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department-students</title>
<style>
table,tr,td,th{
		border: 1px solid black;
		margin:0px;
	}
	th{
background-color: #6A1B9A;
color: white;
    padding: 14px 12px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 16px;
    font-weight: 600;
	}
	td{
	height:28px;
	}
	table{
	border-spacing: 0px;
	text-align: center;
	width:800px;
 margin-top:50px;
		}
		body{
			display: flex;
			flex-direction: column;
			margin: 20px;
			width: 100%;
			align-items: center;
		
		}
		tr:nth-child(even) {
	background-color: #F3E5F5;
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
*
{
margin: 0px;
font-family: "Trebuchet MS", Arial, sans-serif;
    font-size: 18px;
    font-weight: 700;
    color:  black;
    text-align: center;
    letter-spacing: 1px;
}
tr:hover{
background-color:#D8BFD8;
}
</style>
</head>
<body>
	<%ResultSet rs=null; 
		Data ob1=(Data)application.getAttribute("Data");
		rs=ob1.department_cards();%>
	<h1>Department Strength</h1>
	<table>
	<tr><th>stud_department</th><th>stud_gender</th><th>total_students</th></tr>
		<%while(rs.next()){%>
			<tr><td><%=rs.getString("stud_department") %></td>
				<td><%=rs.getString("stud_gender") %></td>
				<td><%=rs.getInt("total_students") %></td>
			</tr>
		<%} %>
	</table>
</body>
</html>