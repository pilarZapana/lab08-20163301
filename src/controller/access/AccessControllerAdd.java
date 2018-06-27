package controller.access;

import java.io.IOException;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pmf.entity.*;
import model.entity.*;

public class AccessControllerAdd extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String qRoles = "select from "+Role.class.getName()+ " where name != ''";
		List<Role> roles = (List<Role>) pm.newQuery(qRoles).execute();
		request.setAttribute("roles", roles);
		
		PersistenceManager pM = PMF.get().getPersistenceManager();
		String queryResources = "select from "+Resource.class.getName()+ " where url != ''";
		List<Resource> resources = (List<Resource>) pM.newQuery(queryResources).execute();
		request.setAttribute("resources", resources);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Access/add.jsp");
		dispatcher.forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

		PersistenceManager pm = PMF.get().getPersistenceManager();
		String roleId = request.getParameter("roleId");
		String urlId = request.getParameter("urlId");
		
		Access newAccess = new Access(Long.parseLong(roleId), Long.parseLong(urlId));
		try {
			pm.makePersistent(newAccess);
		}catch(Exception e) {
			response.sendRedirect("/index.html");
		}
		finally {
			pm.close();
		}
		response.sendRedirect("/access");

	}
	
}
