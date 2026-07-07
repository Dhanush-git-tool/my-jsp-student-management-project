<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
<style>

#searchbutton{
width: 80px;
	height: 20px;
	border-radius: 5px;
	font-weight: bold;
	margin-left:20px;
	background-color: purple;
color: white;
}
#searchbutton:hover{
background-color: #8E24AA;
box-shadow: 0 5px 12px rgba(106, 27, 154, 0.35);
cursor: pointer;
transition: 0.3s;

}
#backbutton{
width: 70px;
	height: 25px;
	border-radius: 5px;
	font-weight: bold;
	margin-top:0px;
	background-color: #A8D3E6;
color: #0D47A1;
}
#backbutton:hover{
background-color: #7FAEC2;
box-shadow: 0 5px 12px rgba(127, 174, 194, 0.35);
cursor: pointer;
transition: 0.3s;
}
#update-button{

width: 70px;
	height: 25px;
	border-radius: 5px;
	font-weight: bold;
	color:white;
}
#update-button:hover{
background-color: #FFB300;
box-shadow: 0 5px 12px rgba(243, 156, 18, 0.35);
cursor: pointer;
transition: 0.3s;
}
body{
display: flex;
flex-direction: column;
align-items:center;
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
SELECT stud_id From student_info order by stud_id asc;
</sql:query>
	<div class="main-1">
	<form action="Update.jsp">
		<h1>Update the student</h1>
		<div class="idinput">
		<label>Student id: </label>
		<select name="idinput">
			<option value=""></option>
			<c:forEach var="row" items="${id.rows}">
				<option value="${row.stud_id}">${row.stud_id}</option>
			</c:forEach>
		</select>
		<input id="searchbutton"type="submit" value="search" >
		</div>
		
	</form>
	</div>
		<sql:query var="student" dataSource="${ myDataSource}">
		Select * from student_info where stud_id=?;
		<sql:param value="${param.idinput}"></sql:param>
		</sql:query>
		<form action="Updateprocess.jsp">
		<input type="hidden" value="${param.idinput}" name="student_id">
		<table>
		<c:forEach var="row" items="${student.rows }">
		
		<tr><td>myfiled</td><td><input type="checkbox" name="myfield" value="stud_name"></td><td>Student Name:</td><td><input type="text" name="stud_nameInput" value="${row.stud_name }"></td></tr>
		<tr><td>myfiled</td><td><input type="checkbox" name ="myfield" value="stud_department"></td><td>Student Department:</td><td><select name="stud_departmentInput">
																																	<option value="CSE" ${row.stud_department.equals("CSE")? "selected" : ""}>Computer Science Engineering</option>
																																	<option value="Mech" ${ row.stud_department.equals("Mech")? "selected" : ""}>Mechanical Engineering</option>
																																	<option value="Civil" ${row.stud_department.equals("Civil")? "selected" : ""}>Civil Engineering</option>
																																	<option value="ECE" ${row.stud_department.equals("ECE")? "selected" : ""}>Electronic Communication Engineering</option>
																																	<option value="EEE" ${row.stud_department.equals("EEE")? "selected" : ""}>Electrical and Electronics Engineering</option>
																																	<option value="AIDS" ${row.stud_department.equals("AIDS")? "selected" :""}>Artificial Intelligence and Data Science</option>
																																	<option value="It" ${row.stud_department.equals("It")? "selected" : ""}>Information Technology</option></select></td></tr>
		<tr><td>myfiled</td><td><input type="checkbox" name ="myfield" value="stud_Email"></td><td>Student Email:</td><td><input type="text" name="stud_EmailInput" value="${row.stud_Email }"></td></tr>
		<tr><td>myfiled</td><td><input type="checkbox" name="myfield" value="stud_phno"></td><td>Student Phono:</td><td><input type="text" name="stud_phnoInput" value="${row.stud_phno}"></td></tr>
		<tr><td>myfiled</td><td><input type="checkbox" name="myfield" value="stud_gender"><td>Student Gender:</td><td><input type="radio" name="stud_genderInput" id="male"value="Male" ${row.stud_gender.equals("Male")? "checked" : "" }><label for="male">Male</label><input type="radio" value="Female" id="female" name="stud_genderInput" ${row.stud_gender.equals("Female")? "checked" : ""}><label for="female">Female</label></td></tr>
		<tr><td>myfiled</td><td><input type="checkbox" name="myfield" value="stud_dob"><td>Student DOB</td><td><input type="date" name="stud_dobInput" value="${row.stud_dob }"></td></tr>
		<tr><td><input id="update-button" type="submit" value="update" style="background-color: orange;color:black;"></td></tr>
		</c:forEach>
		</table>
		</form>
		<c:if test="${not empty param.idinput }">
		<div class="cancel">
		<form action="index.jsp">
		<input id="backbutton" type="submit" value="back" >
		</form>
		</div>
		</c:if>
	
		
	
	
	
</body>
</html>