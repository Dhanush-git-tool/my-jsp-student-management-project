package com.connection;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class DBconnection {
	
	public  Connection getConnection() {
		Connection con=null;
	try {
		InitialContext ctx=new InitialContext();
		DataSource ds= (DataSource)ctx.lookup("java:comp/env/jdbc/MyDB");
		con=ds.getConnection();
	}
	catch(SQLException | NamingException se){
		System.out.println(se);
	}
	return con;
	}
}
