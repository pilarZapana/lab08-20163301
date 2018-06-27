package controller.roles;

import java.io.IOException;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import pmf.entity.*;
import model.entity.Role;

public class RolesControllerAdd extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Roles/add.jsp");
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

		PersistenceManager pm = PMF.get().getPersistenceManager();
		String name = request.getParameter("name");
		
		Role newR = new Role(name);
		try {
			pm.makePersistent(newR);
		}catch(Exception e) {
			response.sendRedirect("/index.html");
		}
		finally {
			pm.close();
		}
		response.sendRedirect("/roles");

	}
	
}
