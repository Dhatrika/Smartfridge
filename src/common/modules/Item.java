package common.modules;

public class Item {
	
	private Integer itemId;
	private String itemName;
	private Integer minQuant;
	private Integer maxQuant;	
	private Integer quantity;
	private Integer newQuantity;
	private String statusColor;
	
	public Integer getItemId() {
		return itemId;
	}
	
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getMinQuant() {
		return minQuant;
	}

	public void setMinQuant(Integer minQuant) {
		this.minQuant = minQuant;
	}

	public Integer getMaxQuant() {
		return maxQuant;
	}

	public void setMaxQuant(Integer maxQuant) {
		this.maxQuant = maxQuant;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getNewQuantity() {
		return newQuantity;
	}

	public void setNewQuantity(Integer newQuantity) {
		this.newQuantity = newQuantity;
	}

	public Item(){
		
	}

	public String getStatusColor() {
		return statusColor;
	}

	public void setStatusColor(String statusColor) {
		this.statusColor = statusColor;
	}

}
