<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.Resource" %>
<%@ page import = "java.util.Date"  %>
<%@ page import = "java.text.SimpleDateFormat"  %>
<%
Resource r = (Resource) request.getAttribute("resource");
SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");	
String fecha = formato.format(r.getDate());
%>
<!DOCTYPE html>
<html>
<title>Ver Resource</title>
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
				<p style="color:blue">ID:</p>
				<p><%=r.getId()%></p>
				<p style="color:blue">Url:</p>
				<p><%=r.getUrl()%></p>
				<p style="color:blue">Status:</p>
				<p><%=r.isStatus()%></p>
				<p style="color:blue">Fecha de creación:</p>
				<p><%=fecha%></p>
				
			<a href="/resources" class="btn btn-info"  role="button"  >Retornar</a>
			</header>
				
	
</body>
</html>
