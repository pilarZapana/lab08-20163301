<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="controller.alumno.*" %>
<%@ page import = "model.entity.*"  %>

<% 
	Alumno alumno = (Alumno) request.getAttribute("alumnos");
%>
<!DOCTYPE html>
<html>
<head>
<title>ACL</title>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  

<link rel="stylesheet" href="/estilo.css" />

</head>

<body>

 
 <nav class="dropdownmenu">
<ul>
	<li><a href="/index.html">Pagina Principal</a></li>
    <li><a href="/roles" >Roles</a></li>
    <li><a href="/users" >Users</a></li>
    <li><a href="/resources">Resources</a></li>
    <li><a href="/access" >Access</a></li>
    <li><a href="/alumnos" >Alumnos</a></li>
   	<li><a href="/users/login" >Login</a></li>
    <li><a href="/users/logout" >Logout</a></li>
    <li><a href ="/alumnos/add">Agregar alumno</a>
</ul>
</nav>
<p>           </p>
<p>           </p>
<p>           </p>
	<span class="title">
		<h1 align="center">VER ALUMNO</h1>
	</span>

	<p></p>
	<div class="table">
			<center><h2>Alumno con ID:  <%= alumno.getId() %></h2></center>
				<table class="vertical-table">
				<tbody>
		
							<tr>
								<th scope="row">Nombre: </th>
								<td><%= alumno.getName() %></td>
							</tr>
							<tr>
								<th scope="row">Dirección: </th>
								<td><%= alumno.getDireccion() %></td>
							</tr>
							<tr>
								<th scope="row">Email:</th>
								<td><%= alumno.getEmail() %></td>
							</tr>
							<tr>
								<th scope="row">Edad:</th>
								<td><%= alumno.getEdad() %></td>
							</tr>
							<tr>
								<th scope="row">Grado de Estudios: </th>
								<td><%= alumno.getgEstudios() %></td>
							</tr>
							<tr>
								<th scope="row">Genero: </th>
								<td><%= alumno.getGenero() %></td>
							</tr>
						</tbody>
					</table>
					<p><a href="/alumnos/view" class="btn btn-info"  role="button"  >Retornar a la lista de alumnos</a></p>
				</div>
	
</body>
</html>