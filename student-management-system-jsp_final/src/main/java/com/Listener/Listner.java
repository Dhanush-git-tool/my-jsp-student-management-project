package com.Listener;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.connection.DBconnection;
import Dao.student_Dao;
import student_classes.*;

/**
 * Application Lifecycle Listener implementation class Listner
 *
 */
@WebListener
public class Listner implements ServletContextListener {

    /**
     * Default constructor. 
     */
	Connection con=null;
	ScheduledExecutorService scheduler=null;
    public Listner() {
        // TODO Auto-generated constructor stub
    }
   public void contextInitialized(ServletContextEvent sce) {
	   try {
		ServletContext context=sce.getServletContext();
		InitialContext ctx=new InitialContext();
		DataSource ds= (DataSource)ctx.lookup("java:comp/env/jdbc/MyDB");
		con=ds.getConnection();
		System.out.println("connection established");
		Data data= new Data(con);
		scheduler=Executors.newSingleThreadScheduledExecutor();
	
		scheduler.scheduleAtFixedRate(()->{ResultSet rs=data.select_student();}, 0, 1,TimeUnit.SECONDS);
		context.setAttribute("Data", data);
	   } catch (NamingException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	   }
	   }
    public void contextDestroyed(ServletContextEvent sce) {
    	try {
    		if(con!=null) {
			con.close();
    		}
    		
			System.out.println("the connection is closed!");
		} catch (SQLException e) {
		System.out.println(e);
		}
    }

	
}
