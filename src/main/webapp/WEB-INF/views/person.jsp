<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spring Boot Application</title>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}

.mail {
	margin: inherit;
	padding-top: 10px;
	padding-bottom: 10px;
	width: 400px;
	background: #D8F1F8;
	border: 1px soild silver;
}
</style>
</head>
<body>

    <h3 align="right"><a href="logout">Logout</a></h3>
 
	<center>
		<h2 style="color:MediumVioletRed;">Add a Person</h2>
		<c:url var="addAction" value="/person/add"></c:url>

		<c:if test="${!empty errorMessge}">
			<div style="color: red; font-weight: bold; margin: 30px 0px;">${errorMessge}</div>
		</c:if>

		<div class="mail">
			<form:form action="${addAction}" modelAttribute="person">
				<table>
					<c:if test="${!empty person.name}">
						<tr>
							<td><form:label path="id"> <spring:message text="ID" />
								</form:label></td>
							<td><form:input path="id" readonly="true" size="12"
									disabled="true" /> <form:hidden path="id" /></td>
						</tr>
					</c:if>
					<tr>
						<td><form:label path="name">
								<spring:message text="Name   " />
							</form:label></td>
						<td><form:input path="name" /></td>
					</tr>
					<br>
					<tr>
						<td><form:label path="country">
								<spring:message text="Country   " />
							</form:label></td>
						<td><form:input path="country" /></td>
					</tr>
					<tr>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td colspan="4"><c:if test="${!empty person.name}">
								<input type="submit"
									value="<spring:message text="Edit Person"/>" />
							</c:if> <c:if test="${empty person.name}">
								<input type="submit" value="<spring:message text="Add Person"/>" />
							</c:if></td>
					</tr>
				</table>
			</form:form>
		</div>

		<br>
		<h2 style="color:MediumVioletRed;">Persons List</h2>
		<c:if test="${!empty listPersons}">
			<table class="tg">
				<tr>
					<th width="80">Person ID</th>
					<th width="120">Person Name</th>
					<th width="120">Person Country</th>
					<th width="60">Edit</th>
					<th width="60">Delete</th>
				</tr>
				<c:forEach items="${listPersons}" var="person">
					<tr>
						<td>${person.id}</td>
						<td>${person.name}</td>
						<td>${person.country}</td>
						<td><a href="<c:url value='/edit/${person.id}' />">Edit</a></td>
						<td><a href="<c:url value='/remove/${person.id}' />">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</center>
</body>
</html>
