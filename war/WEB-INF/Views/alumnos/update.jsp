<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="controller.alumno.*" %>

<%@ page import="model.entity.*" %>
<%@ page import="java.util.List" %>
<% Alumno r = (Alumno)request.getAttribute("alumnos");%>

<%//Aca mandariamos junto con los datos al servlet %>
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
		<h1 align="center">EDITAR ALUMNO</h1>
	</span> 
	<p /> 
	<p></p>
	
	<form method="post" action="/alumnos/update?alumnoId=<%=r.getId() %>" onsubmit="return checkSubmit();">
	
		<input type="hidden" name="action" value="editarAlumno" />
		<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC">
		
		<h1>Id: <%= r.getId() %></h1><br>
		
		
		<tr>
				<td style="color: #23241F; font-weight: bold;">Nombre del alumno:</td>
				<td bgcolor="#ffffff"><input type="input" name="name" pattern="[A-Za-z0-9 ]*" minlength="3" maxlength="80" value="<%=r.getName() %>"required></td>
			</tr>
			<tr>
				<td style="color: #23241F; font-weight: bold;">Direccion:</td>
				<td bgcolor="#ffffff"><input type="input" name="direccion"  pattern="[A-Za-z0-9. ]*" minlength="3" maxlength="80" value="<%= r.getDireccion() %>"></td>
			</tr>
			<tr>
				<td style="color: #23241F; font-weight: bold;">Correo Electrónico:</td>
				<td bgcolor="#ffffff"><input type="email" name="email" value="<%=r.getEmail()%>"></td>
			</tr>
			<tr>
				<td style="color: #23241F; font-weight: bold;">Edad:</td>
				<td bgcolor="#ffffff"><input type="number" name="edad" min="1" max="50" value="<%=r.getEdad() %>"required></td>
			</tr>
		
			<td style="color: #23241F; font-weight: bold;">Nivel en el que estudia: </td>
				<td><select name="gEstudios" style="width: 150px" value="<%= r.getgEstudios()%>"required>
						
						<option>Primaria</option>
						<option>Secundaria</option>
				</select></td>
				
				<tr>
				<td style="color: #23241F; font-weight: bold;">Genero: </td>
				<td><select name="genero" style="width: 150px" value="<%=r.getGenero()%>"required>
						<option>Masculino</option>
						<option>Femenino</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#ffffff" align="center"><input
					type="submit" value="Submit" id="btsubmit"></td>
			</tr>
		</table>
	</form>

</body>
</html>