package model.entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType =IdentityType.APPLICATION)
public class Alumno  {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String name;
	@Persistent private String direccion;
	@Persistent private String email;
	@Persistent private int edad;
	@Persistent private String gEstudios;
	@Persistent private String genero;

	public Alumno(String name, String direccion, String email, int edad, String gEstudios, String genero) {
		this.name = name;
		this.direccion = direccion;
		this.email = email;
		this.edad = edad;
		this.gEstudios = gEstudios;
		this.genero = genero;
		
	}
	
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public String getgEstudios() {
		return gEstudios;
	}
	public void setgEstudios(String gEstudios) {
		this.gEstudios = gEstudios;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	

} 