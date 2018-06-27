package controller.users;

import java.io.IOException;
import java.util.Date;
import java.util.List;

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
import model.entity.User;

public class UsersControllerEdit extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Key k =	KeyFactory.createKey(User.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
		User u = pm.getObjectById(User.class, k);
		
		PersistenceManager pm2= PMF.get().getPersistenceManager();
		String query = "select from "+Role.class.getName()+ " where name != ''";
		List<Role> roles = (List<Role>) pm2.newQuery(query).execute();
		
		request.setAttribute("roles", roles);
		request.setAttribute("user", u);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/edit.jsp");
		dispatcher.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String status = request.getParameter("status");
		String name = request.getParameter("name");
		String apel = request.getParameter("apel");
		String email = request.getParameter("email");
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		Date birth = new Date(Integer.parseInt(year)-1900, Integer.parseInt(month)-1, Integer.parseInt(day));
		String gender = request.getParameter("gender");
		Long role = Long.parseLong(request.getParameter("role"));
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Key k =	KeyFactory.createKey(User.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
		User u = pm.getObjectById(User.class, k);
		boolean prueba = false;
		if(status.equalsIgnoreCase("true")){
			prueba = true;
		}
		try {
			if(u.getStatus() != prueba || !name.equals("") || !apel.equals("") || u.getRoleId() == role){
				
				if(u.getStatus() != prueba){
					u.setStatus(prueba);
				}
				if(!name.equals("")){
					u.setNombre(name);
				}
				if(!apel.equals("")){
					u.setApel(name);
				}
				if(!email.equals("")){
					u.setEmail(email);
				}
				
				if(!(birth==null)){
					u.setBirth(birth);
				}
				
				if(!gender.equals("")){
					u.setGender(gender);
				}
				
				if(u.getRoleId() == role){
					u.setRoleId(role);
				}

			}

		} finally {
			pm.close();
		}
		response.sendRedirect("/users");

	}
	
}
