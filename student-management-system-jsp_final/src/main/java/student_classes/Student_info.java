package student_classes;

import java.io.Serializable;

public class Student_info implements Serializable {

	private static final long serialVersionUID = 1L;
private String name;
private String email;
private String phno;
private String department;
private String gender;
private String date;

public String getName() {
	return name;
}

public void setName(String name) {
	this.name=name;
}
public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPhno() {
	return phno;
}

public void setPhno(String phno) {
	this.phno = phno;
}

public String getDepartment() {
	return department;
}

public void setDepartment(String department) {
	this.department = department;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}


}

