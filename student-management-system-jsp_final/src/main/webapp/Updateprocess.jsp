<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update-successfull page</title>
<style>
	body{
	text-align: center;
	}
</style>
</head>
<body>
	<% int myid=Integer.parseInt(request.getParameter("student_id")); 
	String[] myfield=request.getParameterValues("myfield");
	String update_query="update student_info Set ";
	for(int i=0;i<myfield.length;i++){
		if(i<myfield.length-1){
			update_query+=myfield[i]+"=?,";
		}
		else{
			update_query+=myfield[i]+"=? Where stud_id=?;";
		}
	}%>
	<c:set var="sql_updatequery" value="<%=update_query%>"></c:set>
	<c:set var="student_id" value="<%=myid%>"></c:set>
	<sql:setDataSource 
	var="myDataSource"
  driver="com.mysql.cj.jdbc.Driver"
  url="jdbc:mysql://localhost:3306/student_database_db"
  user="root"
  password="root"/>
	<sql:update var="student" dataSource="${myDataSource}">
		<c:out value="${sql_updatequery}"></c:out>
		<%for(int i=0;i<myfield.length;i++){
			String fieldname=myfield[i]+"Input";
			if(myfield[i].equals("stud_dob")){
			SimpleDateFormat sdate= new SimpleDateFormat("yyyy-MM-dd");	
			java.util.Date jdate=sdate.parse(request.getParameter(fieldname));
			java.sql.Date sqldate=new java.sql.Date(jdate.getTime());%>
			<sql:param value="<%=sqldate %>"></sql:param>
		<% }
			else{
				String myvalue=request.getParameter(fieldname);%>
				<sql:param value="<%=myvalue %>"></sql:param>
			<%} 
			
		
		}%>
		<sql:param value="${student_id}"></sql:param>
	</sql:update>
	<h1>Update successfull!!!</h1>
	<form action="index.jsp">
	<input type="submit" value="back" style="background-color:brown;color:white;">
	</form>
</body>
</html>