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
<link rel="stylesheet" href="/css/contact.css"/>
<title>Contact | Movie Spree</title>
</head>
<body>
	<div id="register-container">
		<div id="form-header" class="d-flex justify-content-end">
			<a href="/home" class="fs-3 mt-2 me-4 text-decoration-none" id="home-btn">Home</a>
		</div>
		<div id="form-container" class="d-flex justify-content-center align-items-center">
			<div>
				<form:form action="/send/contact" method="POST" modelAttribute="formdata">
		            <h1 class="text-center">Contact</h1>
		            <form:label path="fullName" class="form-label">Full name:</form:label>
		            <form:input path="fullName" type="text" class="form-control"/>
		            <form:label path="email" class="form-label mt-2">Email:</form:label>
		            <form:input path="email" type="email" class="form-control"/>
                    <form:label path="question" class="form-label">Question:</form:label>
                    <form:textarea path="question" class="form-control" cols="30" rows="8"></form:textarea>
		            <button type="submit" class="mt-3" id="submit-button">Submit</button>
		        </form:form>
			</div>
		</div>
	</div>
</body>
</html>