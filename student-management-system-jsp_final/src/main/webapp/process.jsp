<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>process.jsp</title>
</head>
<body>
  <%
  	String name=request.getParameter("username");
  	String email=request.getParameter("email-id");
  	String phno=request.getParameter("phone-no");
  	String department=request.getParameter("departments");
  	String gender=request.getParameter("gender");
  	String date=request.getParameter("date");
  	ArrayList<String>errmsg=new ArrayList<String>();
  	for(int i=0;i<name.length();i++){
  		if(Character.isDigit(name.charAt(i))){
  			errmsg.add("The name should not contain any number or digits or special characters");
  		}
  	}
  	if(name.isEmpty()){
  		errmsg.add("The name should not be empty!");
  	}
  	else if(name.length()<3){
  		errmsg.add("The name length should greater than 3");
  	}
  	else if(phno.length()!=10){
  		errmsg.add("The phone number should ocntain only 10 numbers");
  	}
  	if(!errmsg.isEmpty()){
  	%>
  	<h1 style="color:white">Please give the vaild details</h1>
	<ul>
	<%
	for(String x:errmsg){
	%>
	<li><%= x %></li>
	<% } %>
	</ul>
	<jsp:include page="index.jsp"></jsp:include>
	<% } else {%>
	<jsp:useBean id="data"  scope="request" class="student_classes.Student_info"/>
	<jsp:setProperty name="data" property="name" param="username"></jsp:setProperty>
	<jsp:setProperty name="data" property="email" param="email-id"></jsp:setProperty>
	<jsp:setProperty name="data" property="phno"  param="phone-no"></jsp:setProperty>
	<jsp:setProperty name="data" property="department" param="departments"></jsp:setProperty>
	<jsp:setProperty name="data" property="gender"  param="gender"></jsp:setProperty>
	<jsp:setProperty name="data" property="date" param="date"></jsp:setProperty>
	<jsp:forward page="insert.jsp"></jsp:forward>
	<%} %>
</body>
</html>