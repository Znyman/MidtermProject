<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<style>
    nav ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
        display: flex;
    }

    nav ul li {
        margin-right: 10px;
    }

    nav ul li a {
        text-decoration: none;
        padding: 10px 20px;
        background-color: #4CAF50; 
        color: white;
        border: none;
        border-radius: 5px; 
        transition: background-color 0.3s; 
    }

    nav ul li a:hover {
        background-color: #45a049; 
    }
</style>

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
