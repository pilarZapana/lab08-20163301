package controller.alumno;
import java.util.*;
import java.io.IOException;  
import java.io.PrintWriter;

import javax.jdo.PersistenceManager;
import javax.jws.WebService;
import javax.servlet.*;  
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import model.entity.Alumno;
  
@SuppressWarnings("serial")
public class UpdateController extends HttpServlet {  
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)   
	         throws ServletException, IOException {  
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Key k = KeyFactory.createKey(Alumno.class.getSimpleName(), new Long(request.getParameter("alumnoId")).longValue());
		Alumno r = pm.getObjectById(Alumno.class, k);
		
		request.setAttribute("alumnos", r);
		
		request.getRequestDispatcher("/WEB-INF/Views/alumnos/update.jsp").forward(request, response);
		pm.close();
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)   
        throws ServletException, IOException {  
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Key k = KeyFactory.createKey(Alumno.class.getSimpleName(), new Long(request.getParameter("alumnoId")).longValue());
			Alumno r = pm.getObjectById(Alumno.class, k);
			
			  String name=request.getParameter("name");  
		        String direc=request.getParameter("direccion");
		        String email=request.getParameter("email");
		        int edad=Integer.parseInt(request.getParameter("edad"));
		        String gEstudios=request.getParameter("gEstudios");
		        String genero=request.getParameter("genero");
	        
	    
			
		r.setName(name);
		r.setDireccion(direc);
		r.setEmail(email);
		r.setEdad(edad);
		r.setgEstudios(gEstudios);
		r.setGenero(genero);
		
		response.sendRedirect("/alumnos/view");
		pm.close();
		
	}	  
}


