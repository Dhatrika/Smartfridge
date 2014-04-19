package dao.modules;

import java.util.List;

import common.modules.Item;

public interface ItemDao {
	
	public List<Item> getAllItems() throws Exception;
	public void saveAllItems(List<Item> allItems) throws Exception;
}
