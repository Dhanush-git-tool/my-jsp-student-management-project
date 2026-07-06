<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="student_classes.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<title>SMS|Dashboard</title>
<style>
.main_container{
	display: flex;
	flex-direction:column;
	gap:80px;
	justify-content: space-between;
}

.main-1,.main-2,.main-3,.main-4{
	width:85%;
	margin: auto;
	
}
.main-1{
margin-top: 80px;
}

.formgroup{
	display:flex;
	flex-direction: column;
	gap:10px;
	font-weight:bolder;
	
	
}

.formgroup-container-1{
	display:flex;
	gap:20px;
	justify-content:space-around;
	
	
}
.formgroup-container-1>.formgroup>input,select{
border-radius: 5px;
height: 20px;
}
.formgroup>input{
border-radius: 5px;
height: 20px;
}
.formgroup>placeholder{

}
.formgroup-container-2{
	margin:20px;
	display:flex;
	gap:20px;
	justify-content:space-around;
	
}

.formgroup-container-2>.formgroup-gender{
 position: relative;
 right:100px;
}
.formgroup-container-2>.formgroup{
position: relative;
right:230px;
}
.formgroup-container-2>.formgroup-insert_input{
position: relative;
right:310px;
}
#submit{
	position:relative;
	top:28px;
	background-color: green;
	width: 100px;
	height: 30px;
	border-radius: 5px;
	font-weight: bold;
}
#submit:hover{
	cursor: pointer;
	background-color: lightgreen;
	
	transition:0.5s;
	box-shadow: 3px 5px 12px rgba(0, 0, 0, 0.4);

}

body{
	background-color: white;

}
.input-box1{
	display:flex;
		
}

.formgroup-gender{
	display: flex;
	flex-direction: column;
	gap:10px;
	justify-content: flex-end;
	align-items: flex-start;
	font-weight:bolder;
}

.dashboard{
display: flex;
width: 100%;
justify-content: space-around;
margin-top: 80px;
}
.total_students{
	border:1px solid black;
	border-radius:10px;
	height: 150px;
	width: 20%;
	text-align: center;
	box-shadow: -10px -10px 10px rgba(0, 0, 0, 0.12);
	
}
.male_students{
border:1px solid black;
border-radius:10px;
	height: 150px;
	width: 20%;
	text-align: center;
	box-shadow: -10px -10px 10px rgba(0, 0, 0, 0.12);
}
.female_students{
border:1px solid black;
border-radius:10px;
	height: 150px;
	width: 20%;
	text-align: center;
	box-shadow: -10px -10px 10px rgba(0, 0, 0, 0.12);
}
.department_students{
border:1px solid black;
border-radius:10px;
	height: 150px;
	width: 20%;
	text-align: center;
	box-shadow: -10px -10px 10px rgba(0, 0, 0, 0.12);
}
fieldset {
	border-radius: 10px;
}


</style>
<link rel="stylesheet" href="index.css">
</head>
<body>

<%Data ob1=(Data)application.getAttribute("Data");%>
<div class="Dashboard-heading">
	<header><h1 style="text-align: center">Student Management Dashboard</h1></header>
	</div>
	<div class="dashboard">
		<div class="total_students">
		<h2>Total Students</h2>
		<h1><%=ob1.total_students() %></h1>
		<h4>All Students</h4>
		</div>
		<div class="male_students">
			<h2>Male Students</h2>
			<h1><%=ob1.male_students() %></h1>
			<h4>All Male Students</h4>
		</div>
		<div class="female_students">
			<h2>Female Students</h2>
				<%
					int female=0;
					try{
						female=ob1.female_students();}
					catch(Exception e){
						System.out.println(e);
						}%>
			<h1><%=female %></h1>			
			<h4> All Female Students</h4>
		</div>
		<div class="department_students">
			<h2>Departments</h2>
			<h1><%=ob1.department_students() %></h1>
			<h4>Total Departments</h4>
		</div>
	</div>
	<div class="main_container">
	<div class="main-1">
	<form action="process.jsp" method="post">
		<div class="insert-main">
		
			<fieldset>
				<legend>insert-data</legend>
					<div class="formgroup-container-1">
						<div class="formgroup">
							<label>Student Name</label>
							<input type="text" placeholder="Enter Name"name="username" required>
						</div>
						<div class="formgroup">
							<label>Email</label>
							<input type="email" placeholder="Enter email" name="email-id" required>
						</div>
						<div class="formgroup">
							<label>Phone</label>
							<input type="text" placeholder="Enter phone no" name="phone-no" required>
						</div>
						
						<div class="formgroup">
							<label>Department</label>
							<select name="departments" required>
							<option value="">--Select--</option>
							<option value="CSE">Computer Science Engineering</option>
							<option value="Mech">Mechanical Engineering</option>
							<option value="Civil">Civil Engineering</option>
							<option value="ECE">Electronic Communication Engineering</option>
							<option value="EEE">Electrical and Electronics Engineering</option>
							<option value="AIDS">Artificial Intelligence and Data Science</option>
							<option value="It">Information Technology</option>
							
							</select>
						</div>
					</div>
						<div class="formgroup-container-2">
						<div class="formgroup-gender" >
							<label>Gender</label>
							<div class="input-box1">
								<input type="radio" name="gender" value="Male" id="male">
								<label for="male">Male</label>
								<input type="radio" name="gender" value="Female" id="female">
								<label for="female">Female</label>
							</div>
						</div>
						<div class="formgroup">
						<label>Date of Birth</label>
						<input type="date" name="date">
						</div>
						<div class="formgroup-insert_input">
						
						<input id="submit"type="submit" value="Save Student">
						</div>
					</div>
			</fieldset>
		</div>
		
	</form>
	</div>
	<div class="main-2">
		<div class="view-main">
		<form action="select.jsp">
	<fieldset>
	<legend>View-data</legend>
		<div>
		<h1>View the student</h1>
		<input type="submit" value="View Student" >
		</div>
		</fieldset>
	</form>
	</div>
	</div>
		<div class="main-3">
			<div class="update-main">
	<form action="Update.jsp">
		<fieldset>
				<legend>update-data</legend>
				<h1>To update the data click update</h1>
				<input type="submit" value="update Student" >
		</fieldset>
	</form>
	</div>
	</div>
	<div class="main-4">
		<div class="delete-main">
		<form action="Delete.jsp">
			<fieldset>
				<legend>Delete-data</legend>
				<h1>To delete the data click delete</h1>
				<input type="submit" value="Delete Student" >
			</fieldset>
		</form>
	</div>
	</div>
	</div>
</body>
</html>
