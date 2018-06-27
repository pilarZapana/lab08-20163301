package controller.alumno;

import java.io.IOException;  

import javax.jdo.PersistenceManager;
import javax.servlet.*;  
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;  

import model.entity.Alumno;
  
@SuppressWarnings("serial")

public class FindController extends HttpServlet {  
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)   
	         throws ServletException, IOException {  

			PersistenceManager pm = PMF.get().getPersistenceManager();
			Key k = KeyFactory.createKey(Alumno.class.getSimpleName(), Long.parseLong(request.getParameter("alumnoId")));
			Alumno r = pm.getObjectById(Alumno.class, k);
			request.setAttribute("alumnos", r);
			request.getRequestDispatcher("/WEB-INF/Views/alumnos/read.jsp").forward(request, response);
			pm.close();
			
		
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response)   
	         throws ServletException, IOException {  
			doGet(request,response);
		     
		}
}

