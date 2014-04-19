package common.modules;

public class Milk extends Item{

	public Milk(){
		
	}
	
	public Milk(Item item) {
		this.setItemId(item.getItemId());
		this.setItemName(item.getItemName());
		this.setMaxQuant(item.getMaxQuant());
		this.setMinQuant(item.getMinQuant());
		this.setQuantity(item.getQuantity());
		this.setNewQuantity(0);
	}

}
