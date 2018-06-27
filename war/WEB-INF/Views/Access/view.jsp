<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.Access" %>
<%@ page import = "java.util.Date"  %>
<%@ page import = "java.text.SimpleDateFormat"  %>
<%
	Access a = (Access) request.getAttribute("access");
SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");	
String fecha = formato.format(a.getDate());
%>
<!DOCTYPE html>
<html>
<title>Ver Access</title>
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

	<header class="w3-container w3-white w3-center" style="padding:64px 16px">
			<p style="color:blue">ID:</p>
				<p><%=a.getId()%></p>
			<p style="color:blue">ID del rol:</p>
			<p><%=a.getRoleId()%></p>
			<p style="color:blue">ID de la Url:</p>
			<p><%=a.getUrlId()%></p>
			<p style="color:blue">Status:</p>
				<p><%=a.getStatus()%></p>
			<p style="color:blue">Fecha de Creación:</p>	
				<p><%=fecha%></p>
			
			<a href="/access" role="button"  >Retornar</a>
			</header>

</body>
</html>
