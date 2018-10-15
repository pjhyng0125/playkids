package com.playkids.domain;

public class ProfitVO {
	private String profit;
	private String pregdate;
	
	
	public ProfitVO() {
		
		super();
		}
	
	public ProfitVO(String profit, String pregdate) {
		super();
		this.profit = profit;
		this.pregdate = pregdate;
	}


	public String getProfit() {
		return profit;
	}
	public void setProfit(String profit) {
		this.profit = profit;
	}
	public String getPregdate() {
		return pregdate;
	}
	public void setPregdate(String pregdate) {
		this.pregdate = pregdate;
	}

	@Override
	public String toString() {
		return "ProfitVO [profit=" + profit + ", pregdate=" + pregdate + "]";
	}	
}
