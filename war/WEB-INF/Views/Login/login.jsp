<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
	UserService us = UserServiceFactory.getUserService();
	User user = us.getCurrentUser();
%>
<!DOCTYPE html>
<html>
<title>Login</title>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/estilo.css" />
</head>
<body>

<nav class="dropdownmenu">
<ul>
    <li><a href="/index.html" >Pagina Principal</a></li>
    <li><a href="/roles" >Roles</a></li>
    <li><a href="/users" >Users</a></li>
    <li><a href="/resources" >Resources</a></li>
    <li><a href="/access">Access</a></li>
   <li><a href="/alumnos" >Alumnos</a></li>
   	<li><a href="/users/login" >Login</a></li>
    <li><a href="/users/logout" >Logout</a></li>
    </ul>
  </nav>

<!-- Header -->
<header class="w3-container w3-white w3-center" style="padding:128px 16px">

		<p>Email ------------ <%=user.getEmail() %></p>
	<a class="btn btn-dark mr-sm-2" href="/users/login">Iniciar Sesión</a>
	<a class="btn btn-dark mr-sm-2" href="/users/logout">Cerrar Sesión</a>

			
			
</header>


</body>
</html>