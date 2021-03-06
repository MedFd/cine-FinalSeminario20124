package frgp.seminario.cine.account;

import java.util.Date;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnore;

@SuppressWarnings("serial")
@Entity
@Table(name = "Usuario")
@Inheritance(strategy=InheritanceType.JOINED)//una tabla por clase hija
@NamedQuery(name = Account.FIND_BY_EMAIL, query = "select a from Account a where a.email = :email and a.active=1")
public class Account implements java.io.Serializable {

	public static final String FIND_BY_EMAIL = "Account.findByEmail";

	@Id
	private String email;//Username
	
	@Column(nullable = false)
	private Long dni;

	@Column(nullable = false)
	private String nombre;
	
	@Column(nullable = false)
	private String apellido;
	
	@Column(nullable = true)
	private String sexo = "";
	
	@Column(nullable = true)
	private Date fechaNacimiento;
	
	@Column(nullable = true)
	private String preguntaSeguridad ="";
	
	@Column(nullable = true)
	private String respuestaSeguridad ="";
	
	@Column(nullable = false)
	@JsonIgnore
	private String password;

	@Column(nullable = false)
	private String role = "";//TODO: reemplazar por el rol que corresponda
	//ROLES DISPONIBLES: A=Administrador, G=Gerente, C=Cliente

	private boolean active;
	
    protected Account() {
    	//constructor vacio
	}
	
	public Account(String email, String password, String role) {
		this.email = email;
		this.password = password;
		this.role = role;
		this.active = true;
	}

	public Account(Long dni, String nombre, String apellido, String email, String password, String role) {
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.password = password;
		this.role = role;
		this.active = true;
	}

	public Account(Long dni, String nombre, String apellido, String sexo,
			Date fechaNacimiento, String preguntaSeguridad, String respuestaSeguridad, String email,
			String password, String role) {
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
		this.sexo = sexo;
		this.fechaNacimiento = fechaNacimiento;
		this.preguntaSeguridad = preguntaSeguridad;
		this.respuestaSeguridad = respuestaSeguridad;
		this.email = email;
		this.password = password;
		this.role = role;
		this.active = true;
	}

	public Long getDni() {
		return dni;
	}

	public void setDni(Long dni) {
		this.dni = dni;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getPreguntaSeguridad() {
		return preguntaSeguridad;
	}

	public void setPreguntaSeguridad(String preguntaSeguridad) {
		this.preguntaSeguridad = preguntaSeguridad;
	}

	public String getRespuestaSeguridad() {
		return respuestaSeguridad;
	}

	public void setRespuestaSeguridad(String respuestaSeguridad) {
		this.respuestaSeguridad = respuestaSeguridad;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean equals(Account item)
	{
		if (dni != item.getDni())
			return false;
		
		if (nombre.compareTo(item.getNombre()) != 0)
			return false;
		
		if (apellido.compareTo(item.getApellido()) != 0)
			return false;
		
		if (sexo.compareTo(item.getSexo()) != 0)
			return false;
		
		if (fechaNacimiento.compareTo(item.getFechaNacimiento()) != 0)
			return false;
		
		if (preguntaSeguridad.compareTo(item.getPreguntaSeguridad()) != 0)
			return false;
		
		if (email.compareTo(item.getEmail()) != 0)
			return false;
		
		if (password.compareTo(item.getPassword()) != 0)
			return false;
		
		if (role.compareTo(item.getRole()) != 0)
			return false;
		
		return true;
	}
}
