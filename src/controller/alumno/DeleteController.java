package controller.alumno;

import java.io.IOException;  

import javax.jdo.JDOObjectNotFoundException;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import model.entity.Alumno;


@SuppressWarnings("serial")
public class DeleteController extends HttpServlet {  
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Key k = KeyFactory.createKey(Alumno.class.getSimpleName(), new Long(request.getParameter("alumnoId")).longValue());
		try{
			Alumno r = pm.getObjectById(Alumno.class, k);
			if (r !=null){
				Long id = r.getId();
				pm.deletePersistent(r);
				
				response.sendRedirect("/alumnos/view");
				pm.close();
			}
		}catch (JDOObjectNotFoundException e) {
			response.sendRedirect("/alumnos/view");
		}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	doGet(request,response);	
	}
}
