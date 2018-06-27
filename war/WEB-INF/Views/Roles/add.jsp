<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<title>Agregar Rol</title>
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
    <li><a href="/login" >Login</a></li>
    <li><a href="/logout" >Logout</a></li>
    </ul>
  </nav>
	<header class="w3-container w3-white w3-center" style="padding:64px 16px">
	<form action="/roles/add" method="post">
		<p>Name:</p>
		<input type="text" name="name"> <input type="submit" value="Enviar">
	</form>
	<a href="/roles"   role="button"  >Retornar</a>
	</header>


</body>
</html>