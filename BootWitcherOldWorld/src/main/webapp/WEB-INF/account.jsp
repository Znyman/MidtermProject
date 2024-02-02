<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Account Details</title>
</head>
<center>
<img src="https://oc3dmedia.s3.eu-west-2.amazonaws.com/2022/12/the-witchers-3-best-graphics-mod-may-be-added-to-the-games-next-gen-version_6398bbd636f38.jpeg">
</center>
<h2>User Account Details:</h2><br>
<body>
 <c:choose>
        <c:when test="${loginUser!=null}">
            <p>User id: <c:out value="${loginUser.username}"></c:out></p>
            <p>Email:<c:out value="${loginUser.email}"></c:out></p>
            <p>Role: <c:out value="${loginUser.role}"></c:out></p>
            <p>User Active: <c:out value="${loginUser.enabled}"></c:out></p>
       		
        </c:when>
        
        <c:otherwise>
            <p>Not Logged In</p>
        </c:otherwise>
    </c:choose>
<br>
<form action="playGame.do" method="GET">
<input type="submit" value="Play Game">

</form><br>
<form action="logout.do" method="GET">
<input type="submit" value="Logout">
</form>

</body>
</html>