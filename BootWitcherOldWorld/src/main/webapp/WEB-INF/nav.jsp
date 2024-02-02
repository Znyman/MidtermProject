<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav>
    <ul>
        <li><a href="home.do">Home</a></li>
        <c:if test="${not empty loginUser}">
            <li><a href="account.do">Account</a></li>
            <li><a href="logout.do">Logout</a></li>
        </c:if>
        <c:if test="${empty loginUser}">
            <li><a href="login.do">Login</a></li>
        </c:if>
    </ul>
</nav>
