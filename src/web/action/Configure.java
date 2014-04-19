package web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import service.modules.ItemService;
import service.modules.LoginValidate;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

import common.modules.Eggs;
import common.modules.Item;
import common.modules.Juice;
import common.modules.Milk;
import common.modules.Vegetables;
import common.util.Constants;

@SuppressWarnings("serial")
public class Configure extends ActionSupport implements ServletRequestAware, ServletResponseAware, Preparable{
	
	   private HttpServletRequest request;
	   private HttpServletResponse response;
	   private String configureValue;
	   private Milk milk;
	   private Eggs eggs;
	   private Juice juice;
	   private Vegetables veggies;
	   private ItemService itemService;
	   private LoginValidate loginValidate;
	   private String showSuccessMessage = "";
	   private String oldPassword;
	   private String newPassword;
	   private String oldEmailAddress;
	   private String newEmailAddress;
	   private String orderType;
	   
	   public Configure(){
		   
	   }
	   
		public Configure(ItemService itemService, LoginValidate loginValidate) {
		this.itemService = itemService;
		this.loginValidate = loginValidate;
		}

		@Override
		public void setServletRequest(HttpServletRequest arg0) {
			this.request = arg0;
			
		}

		@Override
		public void setServletResponse(HttpServletResponse arg0) {
			this.response = arg0;
			
		}
		
		
		public String getConfigureValue() {
			return configureValue;
		}

		public void setConfigureValue(String configureValue) {
			this.configureValue = configureValue;
		}

		public String execute() throws Exception{
			
			try{
				if(configureValue.equals("minmax") || configureValue.equals("additems") || configureValue.equals("consumeitems") 
						|| configureValue.equals("shoppinglist") || configureValue.equals("statusitems")){
					List<Item> allItems = itemService.getAllItems();
					for(Item item: allItems){
						if(item.getItemName().equals("Milk")){
							milk = new Milk(item);
						}
						if(item.getItemName().equals("Eggs")){
							eggs = new Eggs(item);
						}
						if(item.getItemName().equals("Juice")){
							juice = new Juice(item);
						}
						if(item.getItemName().equals("Vegetables")){
							veggies = new Vegetables(item);
						}
					}
					
					if(configureValue.equals("shoppinglist")){
						milk.setNewQuantity(milk.getMaxQuant() - milk.getQuantity());
						eggs.setNewQuantity(eggs.getMaxQuant() - eggs.getQuantity());
						juice.setNewQuantity(juice.getMaxQuant() - juice.getQuantity());
						veggies.setNewQuantity(veggies.getMaxQuant() - veggies.getQuantity());
					}
					
					if(configureValue.equals("statusitems")){
						setItemStatusColor(milk);
						setItemStatusColor(eggs);
						setItemStatusColor(juice);
						setItemStatusColor(veggies);
					}
					
				}
				else if(configureValue.equals("resetpassword")){
					oldPassword = loginValidate.getPassword();
				}
				else if(configureValue.equals("configuremail")){
					oldEmailAddress = loginValidate.getEmailAddress();
				}
				return configureValue;
			}
			catch(Exception e){
				return "error";
			}
			
		}
		
		public String saveConfigure() throws Exception{
			try{

				List<Item> allItems = new ArrayList<Item>();
				allItems.add(milk);
				allItems.add(eggs);
				allItems.add(juice);
				allItems.add(veggies);
				itemService.saveAllItems(allItems);
				return "reloadMinMax";	
			}
			catch(Exception e){
				return "error";
			}
			
		}
		
		public String saveAddItems() throws Exception{
			try{
				List<Item> allItems = new ArrayList<Item>();
				milk.setQuantity(milk.getNewQuantity() + milk.getQuantity());
				eggs.setQuantity(eggs.getNewQuantity() + eggs.getQuantity());
				juice.setQuantity(juice.getNewQuantity() + juice.getQuantity());
				veggies.setQuantity(veggies.getNewQuantity() + veggies.getQuantity());
				allItems.add(milk);
				allItems.add(eggs);
				allItems.add(juice);
				allItems.add(veggies);
				itemService.saveAllItems(allItems);
				return "reloadAddItems";
			}
			catch(Exception e){
				return "error";
			}			
			
		}
		
		public String saveConsumeItems() throws Exception{
			try{
				List<Item> allItems = new ArrayList<Item>();
				milk.setQuantity(milk.getQuantity()- milk.getNewQuantity());
				eggs.setQuantity(eggs.getQuantity() - eggs.getNewQuantity());
				juice.setQuantity(juice.getQuantity() - juice.getNewQuantity());
				veggies.setQuantity(veggies.getQuantity() - veggies.getNewQuantity());
				allItems.add(milk);
				allItems.add(eggs);
				allItems.add(juice);
				allItems.add(veggies);
				itemService.saveAllItems(allItems);
				return "reloadAddItems";
			}
			catch(Exception e){
				return "error";
			}			
		}
		
		public String savePassword() throws Exception{
			try{
				loginValidate.savePassword(newPassword);
				return "reloadPassword";
			}
			catch(Exception e){
				return "error";
			}			
		}
		
		public String saveEmail() throws Exception{
			try{
				loginValidate.saveEmailAddress(newEmailAddress);
				return "reloadEmail";
			}
			catch(Exception e){
				return "error";
			}			
		}
		
		public String sendShoppingList() throws Exception{
			try{
				List<Item> allItems = new ArrayList<Item>();
				allItems.add(milk);
				allItems.add(eggs);
				allItems.add(juice);
				allItems.add(veggies);
				itemService.sendShoppingList(allItems);
				if(orderType.equals("Print")){
					return "reloadPrintShopList";
				}
				else {
					return "reloadOrderShopList";
				}
			}
			catch(Exception e){
				return "error";
			}
		}

		public Milk getMilk() {
			return milk;
		}

		public void setMilk(Milk milk) {
			this.milk = milk;
		}

		public Eggs getEggs() {
			return eggs;
		}

		public void setEggs(Eggs eggs) {
			this.eggs = eggs;
		}

		public Juice getJuice() {
			return juice;
		}

		public void setJuice(Juice juice) {
			this.juice = juice;
		}

		public Vegetables getVeggies() {
			return veggies;
		}

		public void setVeggies(Vegetables veggies) {
			this.veggies = veggies;
		}

		public ItemService getItemService() {
			return itemService;
		}

		public void setItemService(ItemService itemService) {
			this.itemService = itemService;
		}

		public String getShowSuccessMessage() {
			return showSuccessMessage;
		}

		public void setShowSuccessMessage(String showSuccessMessage) {
			this.showSuccessMessage = showSuccessMessage;
		}

		public LoginValidate getLoginValidate() {
			return loginValidate;
		}

		public void setLoginValidate(LoginValidate loginValidate) {
			this.loginValidate = loginValidate;
		}

		public String getOldPassword() {
			return oldPassword;
		}

		public void setOldPassword(String oldPassword) {
			this.oldPassword = oldPassword;
		}

		public String getNewPassword() {
			return newPassword;
		}

		public void setNewPassword(String newPassword) {
			this.newPassword = newPassword;
		}

		@Override
		public void prepare() throws Exception {
			showSuccessMessage = "No";			
		}

		public String getOldEmailAddress() {
			return oldEmailAddress;
		}

		public void setOldEmailAddress(String oldEmailAddress) {
			this.oldEmailAddress = oldEmailAddress;
		}

		public String getNewEmailAddress() {
			return newEmailAddress;
		}

		public void setNewEmailAddress(String newEmailAddress) {
			this.newEmailAddress = newEmailAddress;
		}

		public String getOrderType() {
			return orderType;
		}

		public void setOrderType(String orderType) {
			this.orderType = orderType;
		}	
		
		private void setItemStatusColor(Item item){
			if(item.getQuantity() < item.getMinQuant()){
				item.setStatusColor(Constants.RED_COLOR);
			}
			else{
				item.setStatusColor(Constants.GREEN_COLOR);
			}
		}
}
