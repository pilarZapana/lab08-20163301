//CLIENT ID
// 897147952668-a3qdjbl6iam9pk1rl5jgp7ocpi2j9fog.apps.googleusercontent.com
//CLIENT SECRET
// i2q8-eyrIF9MUq7yh2TTZC9D

package controller.alumno;
import java.io.IOException;
import java.util.List;


import javax.jdo.PersistenceManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.*;

import com.google.appengine.api.users.UserServiceFactory;

import pmf.entity.PMF;

@SuppressWarnings("serial")
public class AlumnosControllerIndex extends HttpServlet {
	
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		com.google.appengine.api.users.User uGoogle =UserServiceFactory.getUserService().getCurrentUser();
		
		if(uGoogle==null){
			RequestDispatcher dp= getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/error.jsp");
			dp.forward(request, response);
		}
		else{
			PersistenceManager pm=PMF.get().getPersistenceManager();
			String query="select from "+ User.class.getName()+" where email=='"+uGoogle.getEmail()+"' && status==true";
			List<User> uSearch=(List<User>) pm.newQuery(query).execute();
			if(uSearch.isEmpty()){
				RequestDispatcher dp= getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/error.jsp");
				dp.forward(request, response);
			}else{
				System.out.println(request.getServletPath());
			String query2="select from "+ Resource.class.getName()
					+" where url == '"+request.getServletPath()+"' && status==true";
			List <Resource> rSearch=(List<Resource>) pm.newQuery(query2).execute();
			if(rSearch.isEmpty()){
				RequestDispatcher dp= getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/error.jsp");
				dp.forward(request, response);
			}
			else{
				String query3 = "select from "+Access.class.getName()
						+" where roleId == "+uSearch.get(0).getRoleId()+" && urlId== "+rSearch.get(0).getId()+" && status==true";	
						List <Access> aSearch=(List<Access>) pm.newQuery(query3).execute();		
			if(aSearch.isEmpty()){
				RequestDispatcher dp= getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/error.jsp");
				dp.forward(request, response);
			}else{
				RequestDispatcher dp=getServletContext().getRequestDispatcher("/alumnos/view");
				dp.forward(request, response);
				}
			}
		
			}
		}
		
	  
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
				doGet(request,response);
	}
}
