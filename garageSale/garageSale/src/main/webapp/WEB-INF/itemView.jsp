<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Item</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/itemView.css">
</head>
<body>
	<div class="container">
		<h1>Garage Sale</h1>
		<div class="links">
			<a href="http://localhost:8080/home">Home</a>
			<a href="http://localhost:8080/logout">Logout</a>
		</div>
		<h3><c:out value="${item.user.firstName}"/> is trying to sell a <c:out value="${item.title}"/>!</h3>
		<div class="itemInfo">
			<p>Asking price: $<fmt:formatNumber type="number" minFractionDigits="2" value="${item.price}"/></p>
			<p>Description:</p>
			<p><c:out value="${item.description}"/></p>
		<c:if test="${currentUser.id == item.user.id}">
			<div class="accept">
				<form:form action="/garagesale/${item.id}/edit/process" method="post" modelAttribute="item">
				 <input type="hidden" name="_method" value="put">
	
						<form:input type="hidden" path="title"/>
					
						<form:input type="hidden" step="0.01" path="price"/>

						<form:input type="hidden" path="status" value="true" label="yes"/>
					
						<form:input type="hidden" rows="4" path="description"/>
	
				    <form:input type="hidden" path="user" value="${user.id}"/>
				    <form:input type="hidden" path="id" value="${item.id}"/>    
				    <button type="submit" class="btn btn-danger">Mark As Sold</button>
				</form:form>
			</div>
		</c:if> 
		</div>
	</div>
</body>
</html>