package dao.modules;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.modules.Item;
import common.modules.Milk;

public class ItemDaoImpl implements ItemDao{

	@Override
	public List<Item> getAllItems() throws Exception {
		
		Connection connection = new DBConnection().getDBConnection();
		List<Item> returnList = new ArrayList<Item>();
		CallableStatement cs = null;
        ResultSet rs = null;
		
		if (connection != null) {
			try{
				
			
            cs = connection.prepareCall("SELECT ITEMID,NAME,QUANTITY,MINQUANTITY,MAXQUANTITY FROM ITEM");
			cs.executeQuery();
			rs = cs.getResultSet();
			if(rs != null){
				while(rs.next()){
					Item newItem = new Item();
					newItem.setItemId(rs.getInt(1));
					newItem.setItemName(rs.getString(2));
					newItem.setQuantity(rs.getInt(3));
					newItem.setMinQuant(rs.getInt(4));
					newItem.setMaxQuant(rs.getInt(5));
					returnList.add(newItem);
				}
			}
			
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				try {
					connection.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					throw new Exception("Error committing the save statement");
				}
				throw new Exception("Error committing the save statement");
				
			}
			finally{
				try {
					if(rs != null)
					rs.close();
					if(cs != null)
					cs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
				}
				
			}
		}
		else{
			throw new Exception("Cannot establish connection with the database");
		}
		
		return returnList;
	}

	@Override
	public void saveAllItems(List<Item> allItems) throws Exception{
		Connection connection = new DBConnection().getDBConnection();
		CallableStatement cs = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
		if (connection != null) {
			try {
			for(Item item : allItems){
			connection.setAutoCommit(false);
			
			
			ps = connection.prepareStatement("UPDATE ITEM SET MINQUANTITY = ?, MAXQUANTITY = ?, QUANTITY = ? WHERE ITEMID = ?");
			ps.setInt(1, item.getMinQuant());
			ps.setInt(2, item.getMaxQuant());
			ps.setInt(3, item.getQuantity());
			ps.setInt(4, item.getItemId());
			ps.executeUpdate();
			connection.commit();
			}
			
			}
			 catch (SQLException e) {
					// TODO Auto-generated catch block
					try {
						connection.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						throw new Exception("Error committing the save statement");
					}
					throw new Exception("Error committing the save statement");
					
				}
				finally{
					try {
						if(rs != null)
						rs.close();
						if(cs != null)
						cs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
					}
					
				}
			
		}
		else{
			throw new Exception("Cannot establish connection with the database");
		}
	}

}
