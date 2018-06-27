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


import model.entity.*;
import pmf.entity.*;

public class UsersControllerAdd extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "select from "+Role.class.getName()+ " where name != ''";
		List<Role> roles = (List<Role>) pm.newQuery(query).execute();
		
		request.setAttribute("roles", roles);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/add.jsp");
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

		PersistenceManager persistenceManager = PMF.get().getPersistenceManager();
		String nombre = request.getParameter("name");
		String apel = request.getParameter("apel");
		String email = request.getParameter("email");
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		Date birth = new Date(Integer.parseInt(year)-1900, Integer.parseInt(month)-1, Integer.parseInt(day));
		String gender = request.getParameter("gender");
		String rolId = request.getParameter("role");
		User newU = new User(nombre, apel, email, birth, gender, Long.parseLong(rolId));
		try {
			persistenceManager.makePersistent(newU);
		}catch(Exception e) {
			response.sendRedirect("/index.html");
		}
		finally {
			persistenceManager.close();
		}
		response.sendRedirect("/users");

	}
	
}
