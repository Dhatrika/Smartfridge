package service.modules;

import java.util.List;

import common.modules.Item;
import common.util.MailWrap;
import dao.modules.ItemDao;
import dao.modules.LoginDao;

public class ItemServiceImpl implements ItemService{
	
	private ItemDao itemDao;
	private LoginDao loginDao;
	
	public ItemServiceImpl() {
	}

	public ItemServiceImpl(ItemDao itemDao, LoginDao loginDao) {
		this.itemDao = itemDao;
		this.loginDao = loginDao;
	}

	@Override
	public List<Item> getAllItems() throws Exception {
		List<Item> items = itemDao.getAllItems();
		return items;
	}

	@Override
	public void saveAllItems(List<Item> allItems) throws Exception {
		itemDao.saveAllItems(allItems);		
	}

	@Override
	public void sendShoppingList(List<Item> allItems) throws Exception {
        String from = "ndhatrikTest@gmail.com";
        String pass = "ndh@trikTest";
        String emailAddress = loginDao.getEmailAddress();
        String[] to = { emailAddress }; // list of recipient email addresses
        String subject = "Online Order of Items for Smartfridge - ndhatrik";
        String body = "";
        
        //form the body
        StringBuilder strBody = new StringBuilder();
        strBody.append("Shopping List is: \n");
        for(Item item: allItems){
			if(item.getItemName().equals("Milk")){
				strBody.append("Milk - ");
				strBody.append(item.getNewQuantity().toString());
				strBody.append("\n");
			}
			if(item.getItemName().equals("Eggs")){
				strBody.append("Eggs - ");
				strBody.append(item.getNewQuantity().toString());
				strBody.append("\n");
			}
			if(item.getItemName().equals("Juice")){
				strBody.append("Juice - ");
				strBody.append(item.getNewQuantity().toString());
				strBody.append("\n");
			}
			if(item.getItemName().equals("Vegetables")){
				strBody.append("Vegetables - ");
				strBody.append(item.getNewQuantity().toString());
			}
		}
        
        body = strBody.toString();
        
        if(emailAddress != null && emailAddress != ""){
        	MailWrap.sendFromGMail(from, pass, to, subject, body); //send the email
        }		
	}

	public ItemDao getItemDao() {
		return itemDao;
	}

	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}

	public LoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	

}
