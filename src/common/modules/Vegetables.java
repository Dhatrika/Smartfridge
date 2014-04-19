package common.modules;

public class Vegetables extends Item{
	
	public Vegetables(){
		
	}
	
	public Vegetables(Item item) {
		this.setItemId(item.getItemId());
		this.setItemName(item.getItemName());
		this.setMaxQuant(item.getMaxQuant());
		this.setMinQuant(item.getMinQuant());
		this.setQuantity(item.getQuantity());
		this.setNewQuantity(0);
	}

}
