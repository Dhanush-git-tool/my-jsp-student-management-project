<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete-jsp</title>
<style>
.main-2{
display: flex;
gap:50px;
}
#Delete-button{
color: white;
width: 100px;
	height: 25px;
	border-radius: 5px;
	font-weight: bold;
	background-color: red;
}
#Delete-button{
	cursor: pointer;
	transition:0.5s;
	box-shadow:  3px 5px 12px rgba(0, 0, 0, 0.4);

}
#Delete-button:hover{
cursor: pointer;
	background-color:#b30000;
	transition:0.5s;
	box-shadow:  3px 5px 12px rgba(0, 0, 0, 0.4);
}
#cancel-button{
color: black;
width: 100px;
	height: 25px;
	border-radius: 5px;
	font-weight: bold;
	background-color: lightblue;
}
#cancel-button:hover{
cursor: pointer;
	background-color: #7faec2;
	transition:0.5s;
	box-shadow:  3px 5px 12px rgba(0, 0, 0, 0.4);
}
#search-button{
background-color: purple;
color: white;
width: 90px;
	height: 25px;
	border-radius: 5px;
	font-weight: bold;}
#search-button:hover{
cursor: pointer;
	background-color: #9b59b6;
	transition:0.5s;
	box-shadow:  3px 5px 12px rgba(0, 0, 0, 0.4);
}
.table-details{
display: flex;
flex-direction:column;
align-items:  center;
}
.main-2{
padding: 10px;
}
hr{
height: 2px;
background-color: black;
}
h1{
margin:0px;
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
</style>
</head>
<body>
	<sql:setDataSource
  var="myDataSource"
  driver="com.mysql.cj.jdbc.Driver"
  url="jdbc:mysql://localhost:3306/student_database_db"
  user="root"
  password="root"
/>
<sql:query var="id" dataSource="${myDataSource}">
	Select stud_id From student_info order by stud_id asc;
</sql:query>
<div class="table-details">
<form action="Delete.jsp">
	<h1>Delete Student Data</h1>
	<hr>
	<label>Studuent_id: </label>
	<select name="idinput">
	<option value=""></option>
	<c:forEach var="row" items="${id.rows}">
		<option value="${row.stud_id}">${row.stud_id }</option>
	</c:forEach>
	</select>
	<input id="search-button" type="submit" value="search" style="">
</form>

<c:if test="${not empty param.idinput}">

<h2>Selected student_id is:${param.idinput }</h2>
<sql:query var="student" dataSource="${myDataSource }">
	Select * From student_info WHERE stud_id =?;
	<sql:param value="${param.idinput}"></sql:param>
</sql:query>

<table>
<c:forEach var="row" items="${student.rows }">
<tr><td>Student id: </td><td> ${row.stud_id}</td></tr>
	<tr><td>Student Name: </td><td> ${ row.stud_name}</td></tr>
	<tr><td>Student Department: </td><td> ${row.stud_department}</td></tr>
	<tr><td>Student Email: </td><td>${row.stud_Email}</td></tr>
	<tr><td>Student phon-no: </td><td>${row.stud_phno}</td></tr>
	<tr><td>Student gender: </td><td>${row.stud_gender }</td></tr>
	<tr><td>Student Dob: </td><td>${row.stud_dob }</td></tr>
	</c:forEach>
</table>



<div class="main-2">
	<form action="Delete.jsp">
		<input type="hidden" name="deleteid" value="${param.idinput}">
		<input id="Delete-button"type="submit" value="Delete" >
	</form>
	<form action="index.jsp">
	<input id="cancel-button" type="submit" value="cancel" >
	</from>
</div>

</c:if>
<c:if test="${not empty param.deleteid}">
	<sql:update var="students" dataSource="${myDataSource}">
		Delete From student_info
		WHERE stud_id=?;
		
		<sql:param value="${param.deleteid}"></sql:param>
	</sql:update>
	<h1>successfully the data has been Deleted!</h1>
	<form action="index.jsp">
	<input id="back-button" type="submit" value="back" >
	</form>

</c:if>
	</div>
</body>
</html>