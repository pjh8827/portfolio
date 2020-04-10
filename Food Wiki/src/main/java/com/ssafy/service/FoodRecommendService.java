package com.ssafy.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.FoodDao;
import com.ssafy.dto.Food;
import com.ssafy.dto.FoodInfo;
import com.ssafy.dto.NutritionVector;

@Service
public class FoodRecommendService {

	@Autowired
	FoodDao dao;

	/*
	 * 코사인유사도 - 두 식품간 영양성분 벡터를 기반으로 유사도를 측정
	 */
	static double cosine_similarity(double[] v1, double[] v2) {

		double sum_v1 = 0;
		double sum_v2 = 0;
		double v1v2 = 0.0;
		for (int i = 0; i < v1.length; i++) {
			sum_v1 += Math.pow(v1[i], 2);
			sum_v2 += Math.pow(v2[i], 2);
			v1v2 += v1[i] * v2[i];
		}

		return v1v2 / (Math.sqrt(sum_v1) * Math.sqrt(sum_v2));

	}

	private static int binarySearch0(FoodInfo[] a, int fromIndex, int toIndex, Double key) {
		int low = fromIndex;
		int high = toIndex - 1;

		while (low <= high) {
			int mid = (low + high) >>> 1;

			Double midVal = a[mid].simularity;

			int cmp = midVal.compareTo(key);

			if (cmp < 0)
				low = mid + 1;
			else if (cmp > 0)
				high = mid - 1;
			else
				return mid; // key found
		}
		return -(low + 1); // key not found.
	}

	private static int binarySearch(FoodInfo[] a, Double key) {
		return binarySearch0(a, 0, a.length - 1, key);
	}

	private static void FoodInfoquickSort(int first, int last, FoodInfo[] input) {
		FoodInfo temp;
		if (first < last) {
			int pivot = first;
			int i = first;
			int j = last;

			while (i < j) {
				while (input[i].simularity <= input[pivot].simularity && i < last) {
					i++;
				}
				while (input[j].simularity > input[pivot].simularity) {
					j--;
				}
				if (i < j) {
					temp = input[i];
					input[i] = input[j];
					input[j] = temp;
				}
			}

			temp = input[pivot];
			input[pivot] = input[j];
			input[j] = temp;

			FoodInfoquickSort(first, j - 1, input);
			FoodInfoquickSort(j + 1, last, input);
		}
	}

	/**
	 * 
	 * @param code
	 * @return code에 해당하는 식품과 비슷한 영양성분을 가진 유사도 89% 이상의 식품 리스트
	 * @throws SQLException
	 */
	public List<Food> getRecommendFoods(String code) {

		ArrayList<Food> result = new ArrayList<>();

		ArrayList<Food> foods = (ArrayList<Food>) dao.selectAll();

		Food f1 = dao.select(Integer.parseInt(code));

		NutritionVector v1 = new NutritionVector(f1);

		// ArrayList<FoodInfo> arr = new ArrayList<>();
		FoodInfo[] arr = new FoodInfo[foods.size()];
		for (int i = 0; i < foods.size(); i++) {

			FoodInfo fi = new FoodInfo(foods.get(i));
			NutritionVector v2 = new NutritionVector(fi.food);
			fi.simularity = cosine_similarity(v1.getVector(), v2.getVector());
			//System.out.println(fi.simularity);
			arr[i] = fi;

		}

		Arrays.sort(arr, new Comparator<FoodInfo>() {
			@Override
			public int compare(FoodInfo o1, FoodInfo o2) {
				return -1*Double.compare(o1.simularity, o2.simularity);

			}

		});

		
	


		/*
		 * System.out.println("유사도 sorting 후"); for (FoodInfo foodInfo : arr) {
		 * System.out.println(foodInfo.food.getName() + ":" + foodInfo.simularity); }
		 */
		/*
		double limit_simularity = 0.92;

		int limit = binarySearch(arr, limit_simularity);
		if (limit < 0) {
			limit = -limit - 1;
		}
		*/
		//System.out.println("binary search로 0.89 이상의 유사도를 가진 식품 최소 index 검색 " + limit);
		//System.out.println("limit : " + limit);
		

		for (int i =0; i < arr.length; i++) {

		
			Food food = arr[i].food;

	

			if (food.getCode() == Integer.parseInt(code)) {

			
				continue;
			}
			
			if(result.size()==10)
			break;
			
			
			if(arr[i].simularity>=0.95)
			result.add(food);
			//System.out.printf("%s와 %s 유사도 : %f", f1.getName(), food.getName(), arr[i].simularity);
			//System.out.println();

		}
		/*
		for (int i = arr.length - 1; i >= limit; i--) {
			Food food = arr[i].food;
			if (food.getCode() == f1.getCode()) {

				continue;
			}
			result.add(food);
			//System.out.printf("%s와 %s 유사도 : %f", f1.getName(), food.getName(), arr[i].simularity);
			System.out.println();

		}

		*/
		return result;

	}

}
