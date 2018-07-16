<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ page import="model.entity.Resource" %>
<%
	Resource r = (Resource) request.getAttribute("resource");
%>
<!DOCTYPE html>
<html>
<title>Editar Resource</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<link rel="stylesheet" href="/css/estilo.css" />
</head>
<body>

<nav class="dropdownmenu">
   <ul>
    <li><a href="/index.html" >Home</a></li>
    <li><a href="/roles" >Roles</a></li>
    <li><a href="/users" >Users</a></li>
    <li><a href="/resources" >Resources</a></li>
    <li><a href="/access">Access</a></li>
  <li><a href="/alumnos" >Alumnos</a></li>
    <li><a href="/users/login" >Login</a></li>
    <li><a href="/users/logout" >Logout</a></li>
    </ul>
  </nav>
	<header class="w3-container w3-white w3-center" style="padding:64px 16px">
	<form action="edit" method="post"><input type="hidden" name="id" value="<%=r.getId()%>">
				<input type="text" name="url" value="<%=r.getUrl()%>"></td>
				<p></p>
				<input type="radio" name="status" value="true" checked>True
				<input type="radio" name="status" value="false">False</td>
				<p></p>
				<p></p>
				<p><input type="submit" value="Guardar Cambios"></form></p>
			<a href="/resources" class="btn btn-info"  role="button"  >Retornar</a>
</header>



</body>
</html>
