package controller.alumno;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import model.entity.Alumno;
 
@SuppressWarnings("serial")
 
public class AddController extends HttpServlet {  
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)   
	         throws ServletException, IOException {
		doPost(request,response);
	}
	
	    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)   
         throws ServletException, IOException {  
          
		boolean existe = false;
		String res = request.getParameter("name");
		if(res!=null){ 
        String name=request.getParameter("name");  
        String direc=request.getParameter("direccion");
        String email=request.getParameter("email");
        int edad=Integer.parseInt(request.getParameter("edad"));
        String gEstudios=request.getParameter("gEstudios");
        String genero=request.getParameter("genero");
        
        PersistenceManager pm = PMF.get().getPersistenceManager();
        String query = "select  from " + Alumno.class.getName();
		List<Alumno> listas = (List<Alumno>) pm.newQuery(query).execute();
    
		for(Alumno c : listas){
			if(c.getName().equals(name))
				existe=true;
		}
		if(!existe){
			
        Alumno nuevo= new Alumno(name, direc, email,edad,gEstudios,genero);  
       
    	try{
			pm.makePersistent(nuevo);
			response.sendRedirect("/alumnos/view");
			
		}
		finally {
			pm.close();
			}
		}
		else {
			request.setAttribute("existe", existe);
			request.getRequestDispatcher("/WEB-INF/Views/alumnos/add.jsp").forward(request, response);
			}
		}
		else {
			request.setAttribute("existe", existe);
			request.getRequestDispatcher("/WEB-INF/Views/alumnos/add.jsp").forward(request, response);
			
		}
	}
}

