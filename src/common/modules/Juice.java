package common.modules;

public class Juice extends Item{
	
	public Juice(){
		
	}
	
	public Juice(Item item) {
		this.setItemId(item.getItemId());
		this.setItemName(item.getItemName());
		this.setMaxQuant(item.getMaxQuant());
		this.setMinQuant(item.getMinQuant());
		this.setQuantity(item.getQuantity());
		this.setNewQuantity(0);
	}

}
