package com.ssafy.dto;

public class FoodInfo implements Comparable<FoodInfo> {

	public Food food;

	public double simularity;

	public FoodInfo(Food f) {
		// TODO Auto-generated constructor stub
		food = f;

	}

	@Override
	public int compareTo(FoodInfo o) {

		// TODO Auto-generated method stub
		return Double.valueOf(this.simularity).compareTo(o.simularity);
	}

}