package Dao;
import com.connection.DBconnection;
import com.Listener.Listner;
import student_classes.Student_info;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class student_Dao {
	public boolean insert_student(Student_info data){
		DBconnection connection=new DBconnection();
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=connection.getConnection();
			ps=con.prepareStatement("""
									    insert into student_info(stud_name,stud_department,stud_Email,stud_phno,stud_gender,stud_dob)
									    values(?,?,?,?,?,?)""");
			ps.setString(1,data.getName());
			ps.setString(2,data.getDepartment());
			ps.setString(3,data.getEmail());
			ps.setString(4,data.getPhno());
			ps.setString(5,data.getGender());
			SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date dates=date.parse(data.getDate());
			java.sql.Date sqldate= new java.sql.Date(dates.getTime());
			ps.setDate(6, sqldate);
			int row=ps.executeUpdate();
			if(row>0) {
				return true;
			}
			
		}
		catch(SQLException se) {
			System.out.println(se);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			return false;
	
	}
	public ResultSet select_students(Connection con) {
		ResultSet rs=null;
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery("Select * from student_info");
		} catch (SQLException e) {
		System.out.println(e);
		}
		return rs;
	}
	
	public int total_student() {
		Statement st=con.
	}
	
}
