<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.User" %>
<%@ page import="controller.users.*" %>
<%@ page import = "java.util.Date"  %>
<%@ page import = "java.text.SimpleDateFormat"  %>
<%
User u = (User) request.getAttribute("user");
SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");	
String fecha = formato.format(u.getDate());
%>
<!DOCTYPE html>
<html>
<head>
<title>Ver usuario</title>
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
		<p style="color:blue">ID:</p>
		<p><%=u.getId()%></p>
		<p style="color:blue">Rol:</p>
		<p><%=u.getRoleId()%></p>
		<p style="color:blue">Nombres:</p>
		<p><%=u.getNombre()%></p>
		<p style="color:blue">Apellidos:</p>
		<p><%=u.getApel()%></p>
		<p style="color:blue">Email:</p>
		<p><%=u.getEmail()%></p>
		<p style="color:blue">Fecha de nacimiento:</p>
		<p><%=u.getBirth()%></p>
		<p style="color:blue">Genero:</p>
		<p><%=u.getGender()%></p>
		<p style="color:blue">Status:</p>
		<p><%=u.getStatus()%></p>
		<p style="color:blue">Fecha de creación:</p>
		<p><%=fecha%></p>
	
		
		<a href="/users" class="btn btn-info"  role="button"  >Retornar</a>
		
	</header>


</body>
</html>
				