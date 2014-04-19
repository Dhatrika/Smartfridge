package service.modules;

import java.util.List;

import common.modules.Item;
import common.modules.Milk;

public interface ItemService {
	
	public List<Item> getAllItems() throws Exception;
	public void saveAllItems(List<Item> allItems) throws Exception;
	public void sendShoppingList(List<Item> allItems) throws Exception;
}
