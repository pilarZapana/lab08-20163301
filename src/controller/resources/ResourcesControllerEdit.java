package controller.resources;

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
import model.entity.Resource;

public class ResourcesControllerEdit extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Key k =	KeyFactory.createKey(Resource.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
		Resource r = pm.getObjectById(Resource.class, k);
		request.setAttribute("resource", r);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Resources/edit.jsp");
		dispatcher.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String status = request.getParameter("status");
		String url = request.getParameter("url");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Key k =	KeyFactory.createKey(Resource.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
		Resource r = pm.getObjectById(Resource.class, k);
		boolean prueba = false;
		if(status.equalsIgnoreCase("true")){
			prueba = true;
		}
		if(r.isStatus() != prueba || !url.equals("")){
			try {
				r.setStatus(prueba);
				r.setUrl(url);
			
			} finally {
				pm.close();
			}
		}
		response.sendRedirect("/resources");
		
	}
	
}
