<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.Resource"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	List<Resource> resources = (List<Resource>) request.getAttribute("resources");
SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");	
String fecha;
%>
<!DOCTYPE html>
<html>
<title>Resources</title>
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

<header >
<p>   </p>
<p>   </p>
  <h1>Lista de Resources</h1>
 
  	<h2 style="color:blue"><a href="/resources/add">Crear resources</a></h2>
 
 <div > 
	<%
		if (resources!=null && resources.size()>0){
	%>
	 <table border="0" cellspacing="1" cellpadding="5" width="100%">
			<tr>
				<td style="color:blue" class="title">Id</td>
				<td style="color:blue" class="title">Url</td>
				<td style="color:blue" class="title">Status</td>
				<td style="color:blue" class="title">Fecha de creación</td>
				<td style="color:blue">Acciones</td>
			</tr>
			<%
				for (int i = resources.size() - 1; i >= 0; i--) {
			%>
			<tr>
				<td><%=resources.get(i).getId()%></td>
				<td><%=resources.get(i).getUrl()%></td>
				<td><%=resources.get(i).isStatus()%></td>
				<td><%fecha = formato.format(resources.get(i).getDate());%> <%=fecha %></td>
				<td><a href="resources/view?id=<%=resources.get(i).getId()%>">View</a>
					<a href="resources/edit?id=<%=resources.get(i).getId()%>">Edit</a>
					<a href="resources/delete?id=<%=resources.get(i).getId()%>">Delete</a>
				</td>
					</tr>
			<%
				}
			%>
		</table>
	
	<%
		} else {
	%>
	
		<h3>No hay resources</h3>

	<%
		}
	%>
 </div>
 
  
</header>



</body>
</html>