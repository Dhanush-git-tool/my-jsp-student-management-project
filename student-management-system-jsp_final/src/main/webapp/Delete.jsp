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
	<input type="submit" value="search" style="background-color: purple;color: white">
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


<div class=main-2>
	<form action="Delete.jsp">
		<input type="hidden" name="deleteid" value="${param.idinput}">
		<input type="submit" value="Delete" style="color:red">
	</form>
	<form action="index.jsp">
	<input type="submit" value="cancel" style="color:blue;">
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
	<input type="submit" value="back" style="background-color:  blue ;color: white">
	</form>
</c:if>

</body>
</html>