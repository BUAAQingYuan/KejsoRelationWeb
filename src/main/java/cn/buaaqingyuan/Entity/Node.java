package cn.buaaqingyuan.Entity;

public class Node {
	private String category;
	private String name;
	private double value;
	private static int maxValue = 100;
	
	public Node(String category, String name)
	{
		this.setCategory(category);
		this.setName(name);
		this.setValue(100);
	}
	
	public Node(String category, String name, double value)
	{
		this.setCategory(category);
		this.setName(name);
		this.setValue(value * maxValue);
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

}
