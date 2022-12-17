<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/log_reg.css"/>
<title>Register | Movie Spree</title>
</head>
<body>
	<div id="register-container">
		<div id="form-header" class="d-flex justify-content-end">
			<a href="/home" class="fs-3 mt-2 me-4 text-decoration-none" id="home-btn">Home</a>
		</div>
		<div id="form-container" class="d-flex justify-content-center align-items-center">
			<div>
				<form action="/register" method="POST" modelAttribute="newUser">
		            <h1 class="text-warning text-center">Register</h1>
		            <form:label path="userName" class="form-label text-warning">Username:</form:label>
					<form:errors path="userName" class="text-danger"/>
		            <form:input type="text" class="form-control" path="userName"/>
		            <form:label path="email" class="form-label text-warning mt-2">Email:</form:label>
					<form:errors path="email" class="text-danger"/>
		            <form:input type="text" class="form-control" path="email"/>
		            <form:label path="password" class="form-label text-warning mt-2">Password:</form:form:label>
					<form:errors path="password" class="text-danger"/>
		            <form:input type="password" class="form-control" path="password"/>
		            <form:label path="confirm" class="form-label text-warning mt-2">Confirm Password:</form:label>
					<form:errors path="confirm" class="text-danger"/>
		            <form:input type="password" class="form-control" path="confirm"/>
		            <button type="submit" class="mt-3" id="login-button">Register</button>
		        </form>
			</div>
		</div>
		<div class="d-flex justify-content-center align-items-center mt-3">
		    <p class="text-warning">Already Have An Account? <a href="/login_page" class="text-primary text-decoration-none">Login Now</a></p> 
		</div>
	</div>
</body>
</html>