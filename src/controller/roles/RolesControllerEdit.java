package controller.roles;

import java.io.IOException;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;


import pmf.entity.*;
import model.entity.Role;

public class RolesControllerEdit extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Key k =	KeyFactory.createKey(Role.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
		Role r = pm.getObjectById(Role.class, k);
		request.setAttribute("role", r);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Roles/edit.jsp");
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String status = request.getParameter("status");
		String name = request.getParameter("name");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Key k =	KeyFactory.createKey(Role.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
		Role r = pm.getObjectById(Role.class, k);
		boolean prueba = false;
		if(status.equalsIgnoreCase("true")){
			prueba = true;
		}
		try {
			if(r.getStatus() != prueba || !name.equals("")){
				if(r.getStatus() != prueba){
					r.setStatus(prueba);
				}
				if(!name.equals("")){
					r.setName(name);
				}
			}

		} finally {
			pm.close();
		}
		response.sendRedirect("/roles");

	}

}
