package dao.modules;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public Connection getDBConnection() throws Exception{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
		} catch (ClassNotFoundException e) {
			throw e;
		}
		
		Connection connection = null;
		try {
			 
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "ndhatrik","kranti203");
 
		} catch (SQLException e) {
 
			throw e;
 
		}
		return connection;
	}

}
