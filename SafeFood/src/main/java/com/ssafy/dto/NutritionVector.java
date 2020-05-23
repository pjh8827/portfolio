package com.ssafy.dto;

/*
 * 식품정보를 벡터화하는 클래스
 */
public class NutritionVector {

	double total;
	double carb;
	double fat;
	double protein;
	double sugar;

	double natrium;
	double cholesterol;
	double saturedfat;
	double transfat;

	public void setNutritionVector(double total, double carb, double sugar, double protein, double fat, double natrium,
			double cholesterol, double saturedfat, double transfat) {
		// , double natrium, double cholesterol, double saturedfat,double transfat
		//
		this.total = total;
		this.carb = carb * 4.0 / total;
		this.protein = protein * 9.0 / total;
		this.fat = fat * 4.0 / total;

		if (this.carb == 0.0) {
			this.carb = 0.0001;
		}
		if (this.fat == 0.0) {
			this.fat = 0.0001;
		}
		if (this.protein == 0.0) {
			this.protein = 0.0001;
		}

		this.sugar = sugar * 4.0 / total;
		//
		if (this.sugar == 0.0) {
			this.protein = 0.0001;
		}
		this.natrium = natrium / 1000.0;
		if (this.natrium == 0.0) {
			this.natrium = 0.0001;
		}

		this.cholesterol = cholesterol / 1000.0;
		if (this.cholesterol == 0.0) {
			this.cholesterol = 0.0001;
		}
		this.saturedfat = saturedfat * 9.0 / total;
		if (this.saturedfat == 0.0) {
			this.saturedfat = 0.0001;
		}
		this.transfat = transfat * 9.0 / total;
		if (this.transfat == 0.0) {
			this.transfat = 0.0001;
		}

		// this.cholesterol= cholesterol/1000.0;

	}

	public NutritionVector(Food f) {

		setNutritionVector(f.getCalory(), f.getCarbo(), f.getSugar(), f.getProtein(), f.getFat(), f.getNatrium(),
				f.getChole(), f.getFattyacid(), f.getTransfat());

	}

	public double[] getVector() {
		double[] v = { carb, protein, fat, sugar, natrium, cholesterol, saturedfat, transfat };
		return v;
	}

}