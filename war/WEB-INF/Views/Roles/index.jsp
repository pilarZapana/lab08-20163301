<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="controller.roles.*" %>
<%@ page import="model.entity.Role"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	List<Role> roles = (List<Role>) request.getAttribute("roles");
	SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");	
	String fecha;

%>
<!DOCTYPE html>
<html>
<head>
<title>Roles</title>

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

<header >
<p>    </p>
  <p><h1>Lista de Roles</h1></p>
 
  	<a href="/roles/add">Crear rol</a>

 <div > 
  	 <%
		if (roles!=null && roles.size()>0){
	%>
	 <table border="0" cellspacing="1" cellpadding="5" width="100%">
		
			<tr>
				<td  style="color:blue" class="title">Id</td>
				<td  style="color:blue" class="title">Name</td>
				<td  style="color:blue" class="title">Status</td>
				<td  style="color:blue" class="title">Fecha de creación</td>
				<td  style="color:blue" >Acciones</td>
			</tr>
			<%
				for (int i = roles.size() - 1; i >= 0; i--) {
			%>
			<tr>
				<td><%=roles.get(i).getId()%></td>
				<td><%=roles.get(i).getName()%></td>
				<td><%=roles.get(i).getStatus()%></td>
				<td><%fecha = formato.format(roles.get(i).getDate());%> <%=fecha %></td>
				<td><a href="roles/view?id=<%=roles.get(i).getId()%>">View</a>
					<a href="roles/edit?id=<%=roles.get(i).getId()%>">Edit</a> <a
					href="roles/delete?id=<%=roles.get(i).getId()%>">Delete</a></td>
			</tr>
			<%
				}
			%>
		</table>
	
	<%
		} else {
	%>
	
		<h3>No hay roles</h3>

	<%
		}
	%>
 </div>
 
  
</header>



</body>
</html>