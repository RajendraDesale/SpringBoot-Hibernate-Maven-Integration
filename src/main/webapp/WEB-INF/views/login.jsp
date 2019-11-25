<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring Boot Application</title>
<style type="text/css">
.tg {
	border-collapse: inherit;
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

.rq {
	color: #FF0000;
	font-size: 10pt;
}

li {
	list-style-type: none;
	margin-top: 5pt font-size: 12pt;
}

.mail {
	margin: inherit;
	padding-top: 10px;
	padding-bottom: 10px;
	width: 400px;
	background: #D8F1F8;
	border: 1px soild silver;
}

.mail h2 {
	margin-left: 44px;
}

input {
	font-size: 14pt;
}

input:focus, textarea:focus {
	background-color: lightyellow;
}

input submit {
	font-size: 12pt;
}
</style>

<script type="text/javascript">
	function required() {
		var emptuser = document.forms["login"]["username"].value;
		var emptpass = document.forms["login"]["password"].value;
		if (emptuser == "" && emptpass == "") {
			alert("Please input a Value");
			return false;
		} else {
			alert('Code has accepted : you can try another');
			return true;
		}
	}
</script>

</head>
<body>
	<center>
		<h1 style="color:MediumVioletRed;">Employee Management System - Login Form</h1>

		<c:if test="${!empty errorMessge}">
			<div style="color: red; font-weight: bold; margin: 30px 0px;">${errorMessge}</div>
		</c:if>

		<div class="mail">
			<form name='login' action="loginvalidation" method='POST'>
				<table>
					<tr>
						<td>UserName :</td>
						<td><input type='text' name='username' value=''></td>
					</tr>
					<tr>
						<td>Password :</td>
						<td><input type='password' name='password' /></td>
					</tr>
				</table>

				<center>
					<input name="submit" type="submit" value="submit" />
				</center>

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
		<!-- <div class="mail">
			<form name="form1" action="loginvalidation" method='POST'
				onsubmit="required()">
				<ul>
					<li><input type='text' name='username' /></li>
					<li class="rq">*Required Field</li>

					<li><input type='password' name='password' /></li>
					<li class="rq">*Required Field</li>

					<li><input type="submit" name="submit" value="Submit" /></li>
				</ul>
			</form>
		</div> -->
	</center>
</body>
</html>