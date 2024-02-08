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
            <li><a href="logout.do">Logout</a></li>
        </c:if>
        <c:if test="${empty loginUser}">
            <li><a href="login.do">Login</a></li>
        </c:if>
        <li><a href="#" onclick="openMapPopup()">Map</a></li>
    </ul>
</nav>

<script>
    function openMapPopup() {
        var mapUrl = 'https://cf.geekdo-images.com/_Pam5FggR-mtC_UQq9L4-A__imagepagezoom/img/aDuj4y_ezQkKMMiETL4DMNa1S68=/fit-in/1200x900/filters:no_upscale():strip_icc()/pic6516763.jpg';
        var width = 800;
        var height = 600;
        var left = (screen.width / 2) - (width / 2);
        var top = (screen.height / 2) - (height / 2);
        var features = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',resizable=yes,scrollbars=yes';
        window.open(mapUrl, 'MapPopup', features);
    }
</script>
