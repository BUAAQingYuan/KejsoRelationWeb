<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>  
    <title>Spring MVC Demo</title>  
</head>  
   
<body>  
    <h2>All Students</h2>  
   
    <table border="1">  
        <tr>  
            <th>Student Id</th>  
            <th>Student Name</th>  
        </tr>  
        <c:forEach items="${students}" var="student">  
            <tr>  
                <td>${student.id}</td>  
                <td>${student.sentence}</td>  
            </tr>  
        </c:forEach>  
    </table>  
   
</body>  
</html>