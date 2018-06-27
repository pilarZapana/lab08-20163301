package controller.alumno;
import java.io.IOException;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.entity.*;

@SuppressWarnings("serial")
public class ViewController extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doPost(request,response);		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "select  from " + Alumno.class.getName();
		List<Alumno> listas = (List<Alumno>) pm.newQuery(query).execute();
		request.setAttribute("listas", listas);
		request.getRequestDispatcher("/WEB-INF/Views/alumnos/view.jsp").forward(request, response);
		pm.close();
	}

}