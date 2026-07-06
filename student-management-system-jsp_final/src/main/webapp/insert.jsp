<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Dao.student_Dao,student_classes.Student_info"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert.jsp</title>
</head>
<body>
<%---<jsp:useBean id="data" scope="request" class="student_classes.Student_info" />---%>
<%
String dates=request.getParameter("date");
SimpleDateFormat date= new SimpleDateFormat("yyyy-MM-dd");
java.util.Date d=date.parse(dates);
java.sql.Date sqldate=new java.sql.Date(d.getTime());
%>
<sql:setDataSource
  var="myDataSource"
  driver="com.mysql.cj.jdbc.Driver"
  url="jdbc:mysql://localhost:3306/student_database_db"
  user="root"
  password="root"/>
  <sql:update dataSource="${myDataSource}" var="student">
  INSERT into student_info(stud_name,stud_department,stud_Email,stud_phno,stud_gender,stud_dob)
  values(?,?,?,?,?,?)
  <sql:param value="${data.name }"></sql:param>
  <sql:param value="${data.department }"></sql:param>
  <sql:param value="${data.email }"/>
  <sql:param value="${data.phno }"/>
  <sql:param value="${data.gender }"/>
  <sql:param value="<%=sqldate %>"/>
</sql:update>
<h1>The student data is added successfully!</h1>
<form action="index.jsp">
<h4>back to home page</h4>
<input type="submit" value="back" style="background-color: brown;color:white;">
</form>

</body>
</html>