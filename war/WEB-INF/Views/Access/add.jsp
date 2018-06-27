<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>

<%
	List<Role> roles = (List<Role>) request.getAttribute("roles");
	List<Resource> resources = (List<Resource>) request.getAttribute("resources");
%>
<!DOCTYPE html>
<html>
<title>Agregar Access</title>
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


	<header>
	<%
		if (roles.size() > 0 && resources.size() > 0) {
	%>
	<form action="/access/add" method="post">
		<p>Role:</p>
		<select name="roleId">
			<%
				for (int i = 0; i < roles.size(); i++) {
						Role role = roles.get(i);
			%>
			<option value="<%=role.getId()%>"><%=role.getName()%></option>
			<%
				}
			%>
		</select>
		<p>Resource:</p>
		<select name="urlId">
			<%
				for (int i = 0; i < resources.size(); i++) {
						Resource resource = resources.get(i);
			%>
			<option value="<%=resource.getId()%>"><%=resource.getUrl()%></option>
			<%
				}
			%>
		</select>
		<input type="submit" value="Send">
	</form>
	<a href="/access" class="btn btn-info"  role="button"  >Retornar</a>
	<%
		} else {
	%>
	<h1>Asegúrese de haber creado Roles y Recursos, gracias</h1>
	<a href="/access"  role="button"  >Retornar</a>
	<%
		}
	%>

	</header>
</body>
</html>