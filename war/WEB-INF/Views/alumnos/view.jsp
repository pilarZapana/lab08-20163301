<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="controller.alumno.*" %>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.*" %>
<%
Alumno alumnos = (Alumno)request.getAttribute("alumnos");
List<Alumno> listas = (List<Alumno>) request.getAttribute("listas");
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

	<%
		if (listas!=null && listas.size()>0){
	%>

	<table border="0" cellspacing="1" cellpadding="5"
		width="100%">
		<tr bgcolor="#D8F562">
			<td style="color: #1A1A18; font-weight: bold;">Nombre</td>
			<td style="color: #1A1A18; font-weight: bold;">Direccion</td>
			<td style="color: #1A1A18; font-weight: bold;">Email</td>
			<td style="color: #1A1A18; font-weight: bold;">Edad </td>
			<td style="color: #1A1A18; font-weight: bold;">Grado de estudios </td>
			<td style="color: #1A1A18; font-weight: bold;">Genero </td>
		</tr>

		<%
			for ( Alumno c: listas) {
		%>
		<tr>
		<td><%=c.getName()%></td>
		<td> <%= c.getDireccion() %></td>
		<td><%=c.getEmail()%></td>
		<td><%=c.getEdad() %>  </td>
		<td><%= c.getgEstudios()%></td>
		<td><%=c.getGenero()%></td></td>
			<td>
				<span><a href="/alumnos/find?alumnoId=<%= c.getId() %>">Ver mas</a></span>
				<span><a href="/alumnos/delete?alumnoId=<%= c.getId() %>">Eliminar</a></span>
				<span><a href="/alumnos/update?alumnoId=<%= c.getId() %>">Actualizar</a></span>
			</td>
			</tr>
		<%
			}
		%>
	</table>

	<%
		} else{
	%>
		<tr><td>No hay alumnos que mostrar</td></tr>
	<%} %>
	

</body>
</html>