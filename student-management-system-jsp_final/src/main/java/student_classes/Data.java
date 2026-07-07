package student_classes;

import java.sql.Connection;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Data {
	Connection con=null;
	public ResultSet rs=null;
	public Data(Connection con) {
		this.con=con;
	}
	public ResultSet select_student() {
		
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery("Select * from student_info");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println("Student Management system running succussfully!!");
		return rs;
		
	}
	public int total_students() {
		int total=0;
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery("SELECT count(*) as total From student_info;");
			if(rs.next()) {
				total=rs.getInt("total");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}
	public int male_students() {
		int male=0;
	    try {
			Statement st=con.createStatement();
			rs=st.executeQuery("Select stud_gender,count(*) as male_total From student_info group by stud_gender having stud_gender='male';");
			if(rs.next()) {
				male=rs.getInt("male_total");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return male;
	}
	public int female_students() throws SQLException {
		int female=0;
		Statement st=con.createStatement();
		rs=st.executeQuery("SELECT count(*) as female_totals From student_info where stud_gender='female';");
		if(rs.next()) {
			female=rs.getInt("female_totals");
		}
		return female;
	}
	public int department_students() {
		int department=0;
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery("Select count(Distinct stud_department) as total_department From student_info;");
			if(rs.next()) {
			department=rs.getInt("total_department");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return department;
	}
	public ResultSet male_cards() {
		ResultSet rs=null;
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery("Select * From student_info Where stud_gender='Male';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet female_cards() {
		ResultSet rs=null;
		try {
			Statement st= con.createStatement();
			rs=st.executeQuery("Select * From student_info Where stud_gender='Female';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet department_cards() {
		ResultSet rs=null;
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery("select stud_department,\r\n"
					+ "		stud_gender,\r\n"
					+ "		count(*) as total_students \r\n"
					+ "from student_info\r\n"
					+ "group by stud_department,stud_gender\r\n"
					+ "order by stud_department,stud_gender;");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
