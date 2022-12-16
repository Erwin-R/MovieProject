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
<title>Sign In | Movie Spree</title>
</head>
<body>
	<div id="container">
		<div id="form-header" class="d-flex justify-content-end">
			<a href="/home" class="fs-3 mt-2 me-4 text-decoration-none" id="home-btn">Home</a>
		</div>
		<div id="form-container" class="d-flex justify-content-center align-items-center">
			<div>
				<form action="#" method="POST" >
		            <h1 class="text-warning text-center">Login</h1>
		            <label for="login_email" class="form-label text-warning">Email:</label>
		            <input type="text" class="form-control" name="login_email">
		            <label for="login_password" class="form-label text-warning mt-3">Password:</label>
		            <input type="password" class="form-control" name="login_password">
		            <button type="submit" class="mt-3" id="login-button">Login</button>
		        </form>
			</div>
		</div>
		<div class="d-flex justify-content-center align-items-center mt-3">
		     <p class="text-warning">Don't Have An Account? <a href="/register_page" class="text-primary text-decoration-none">Register Now</a> </p> 
		</div>
	</div>
</body>
</html>