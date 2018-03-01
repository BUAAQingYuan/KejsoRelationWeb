package cn.buaaqingyuan.Entity;

public class Link {
	
	private int source;
	private int target;
	private double weight;
	
	public Link(int source,int target,double weight){
		this.setSource(source);
		this.setTarget(target);
		this.setWeight(weight);
	}

	public int getSource() {
		return source;
	}

	public void setSource(int source) {
		this.source = source;
	}

	public int getTarget() {
		return target;
	}

	public void setTarget(int target) {
		this.target = target;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

}
