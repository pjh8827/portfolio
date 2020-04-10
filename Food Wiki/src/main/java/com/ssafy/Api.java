package com.ssafy;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ssafy.dto.Food;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;

import java.io.FileWriter;
import java.io.IOException;

public class Api {


	static void downloadImg(String url){
		

	}

	static String getFoodNutritionXMLStr(String keyword, int pageno) throws IOException {

		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=VhV%2BKsNjBo0fEzXZKe%2Bvg%2B5ma5V6yRBggE7g%2BeUGz0SrYsZ%2FvVr7Kv70RHPzPJGqga%2Fk0DerMNhOzmPbSdd57g%3D%3D"); /*
																																 * Service
																																 * Key
																																 */
		urlBuilder.append(
				"&" + URLEncoder.encode("desc_kor", "UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8")); /* 식품이름 */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="
				+ URLEncoder.encode(Integer.toString(pageno), "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("100", "UTF-8")); /* 한 페이지 결과 수 */
		// urlBuilder.append("&" + URLEncoder.encode("bgn_year","UTF-8") + "=" +
		// URLEncoder.encode("2017", "UTF-8")); /*구축년도*/
		// urlBuilder.append("&" + URLEncoder.encode("animal_plant","UTF-8") + "=" +
		// URLEncoder.encode("(유)돌코리아", "UTF-8")); /*가공업체*/
		URL url = new URL(urlBuilder.toString());
		// System.out.println(url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/jdson");
		// System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		/*
		 * JSONObject xmlJSONObj = XML.toJSONObject(sb.toString()); String
		 * xmlJSONObjString = xmlJSONObj.toString();
		 * System.out.println("### xmlJSONObjString=>" + xmlJSONObjString);
		 */
		String nutritionfilename = String.format("./nutrition/nutrition%d.xml", pageno);
		File file = new File(nutritionfilename);
		FileWriter writer = null;

		try {
			// 기존 파일의 내용에 이어서 쓰려면 true를, 기존 내용을 없애고 새로 쓰려면 false를 지정한다.
			writer = new FileWriter(file, false);
			writer.write(sb.toString());
			writer.flush();

			// System.out.println("DONE");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (writer != null)
					writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// System.out.println(sb.toString());
		// return xmlJSONObjString;
		return sb.toString();
	}

	static String getFoodInfoXMLStr(String keyword, int pageno) throws IOException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/B553748/CertImgListService/getCertImgListService"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "="
				+ "HA1x75KCl7PpdcZamrJeRzgJIL%2F8wf1ofSBzYwhFl8Mj8GCHS0KozO%2Bojwd19GIZxkwPC9zDqMMWJeOq3h09cw%3D%3D"); /*
																														 * Service
																														 * Key
																														 */
		urlBuilder.append(
				"&" + URLEncoder.encode("prdlstNm", "UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8")); /* 식품이름 */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="
				+ URLEncoder.encode(Integer.toString(pageno), "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("100", "UTF-8")); /* 한 페이지 결과 수 */
		// urlBuilder.append("&" + URLEncoder.encode("bgn_year","UTF-8") + "=" +
		// URLEncoder.encode("2017", "UTF-8")); /*구축년도*/
		// urlBuilder.append("&" + URLEncoder.encode("animal_plant","UTF-8") + "=" +
		// URLEncoder.encode("(유)돌코리아", "UTF-8")); /*가공업체*/
		URL url = new URL(urlBuilder.toString());
		// System.out.println(url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/jdson");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);

		}
		rd.close();
		conn.disconnect();

		String nutritionfilename = String.format("./foodinfo/foodinfo%d.xml", pageno);
		File file = new File(nutritionfilename);
		FileWriter writer = null;

		try {
			// 기존 파일의 내용에 이어서 쓰려면 true를, 기존 내용을 없애고 새로 쓰려면 false를 지정한다.
			writer = new FileWriter(file, false);
			writer.write(sb.toString());
			writer.flush();

			System.out.println("DONE");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (writer != null)
					writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
		// String xmlJSONObjString = xmlJSONObj.toString();

		// System.out.println(sb.toString());

		return sb.toString();
	}

	static HashMap<String, JSONObject> getFoodNutritionInfo() throws IOException {

		HashMap<String, JSONObject> m = new HashMap<String, JSONObject>();

		for (int no = 1; no <= 227; no++) {
			// System.out.println("read no :"+no);
			String nutritionfilename = String.format("./nutrition/nutrition%d.xml", no);
			File file = new File(nutritionfilename);

			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
			StringBuilder sb = new StringBuilder();
			String str = "";
			while ((str = br.readLine()) != null && str.length() != 0) {
				sb.append(str);
			}

			JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());

			String xmlJSONObjString = xmlJSONObj.toString();

			JSONArray arr = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONArray("item");

			for (int i = 0; i < arr.length(); i++) {

				JSONObject js = (JSONObject) arr.get(i);

				// System.out.println(arr.get(i));BGN_YEAR
				String manufacturer = js.getString("ANIMAL_PLANT");
				Integer beginyear = js.getInt("BGN_YEAR");
				String foodname = js.getString("DESC_KOR");
				// System.out.println(manufacturer);

				if (manufacturer == null || manufacturer == "") {
					continue;
				}
				if (m.containsKey(foodname)) {

					if (m.get(foodname).getInt("BGN_YEAR") < beginyear) {
						m.put(foodname, js);
					}

				} else {
					m.put(foodname, js);
				}

			}

		}
		return m;
		// System.out.println(m.size());
		/*
		 * for (String key : m.keySet()) { System.out.println(m.get(key)); }
		 */

	}

	static HashMap<String, JSONObject> getFoodExtraInfo() throws IOException {

		HashMap<String, JSONObject> m = new HashMap<String, JSONObject>();

		for (int no = 1; no <= 154; no++) {
			// System.out.println("read no :"+no);
			String nutritionfilename = String.format("./foodinfo/foodinfo%d.xml", no);
			File file = new File(nutritionfilename);

			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
			StringBuilder sb = new StringBuilder();
			String str = "";
			while ((str = br.readLine()) != null && str.length() != 0) {
				sb.append(str);
			}

			JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());

			String xmlJSONObjString = xmlJSONObj.toString();

			JSONArray arr = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONArray("item");

			for (int i = 0; i < arr.length(); i++) {

				JSONObject js = (JSONObject) arr.get(i);
				// System.out.println(js);
				// System.out.println(arr.get(i));BGN_YEAR
				// String manufacturer = js.getString("ANIMAL_PLANT");
				Integer beginyear = js.getInt("prdlstReportNo");
				String foodname = js.getString("prdlstNm");
				// System.out.println(manufacturer);

				if (m.containsKey(foodname)) {

					// System.out.println("dup :"+foodname);
					if (m.get(foodname).getInt("prdlstReportNo") < beginyear) {
						m.put(foodname, js);
					}

				} else {
					m.put(foodname, js);
				}

			}

		}

		// System.out.println(m.size());
		/*
		 * for (String key : m.keySet()) { System.out.println(m.get(key)); }
		 */
		return m;

	}

	public static HashMap<String, Food> getFoodData() throws IOException {
		// 22629
		// 15400
		HashMap<String, JSONObject> nutmap = getFoodNutritionInfo();
		HashMap<String, JSONObject> infomap = getFoodExtraInfo();

		int codenum=21;
		HashMap<String, Food> res=new HashMap<>();
		for (String foodname_nutrition : nutmap.keySet()){

			for (String foodname_foodinfo  : infomap.keySet()) {
			
			
				if(foodname_nutrition.equals(foodname_foodinfo)){


					JSONObject nutjs = nutmap.get(foodname_nutrition);
					JSONObject infojs = infomap.get(foodname_foodinfo);

					 //System.out.println(nutmap.get(foodname_nutrition));
					 //System.out.println(infomap.get(foodname_foodinfo));

					//System.out.println("cnt:"+cnt+foodname_foodinfo);
					String name = foodname_foodinfo;
					Double supportpereat = nutjs.getDouble("SERVING_WT");

					Double calory = (Double) nutjs.getDouble("NUTR_CONT1");

					Double carbo = (Double) nutjs.getDouble("NUTR_CONT2");
					Double protein;

					Double fat;
					Double sugar;
					Double natrium;
					Double chole;
					Double fattyacid;
					Double transfat;

					try {
						protein = (Double) nutjs.getDouble("NUTR_CONT3");
					} catch (Exception e) {
						protein = 0.0;
						// TODO: handle exception
					}

					try {
						fat = (Double) nutjs.getDouble("NUTR_CONT4");
					} catch (Exception e) {
						fat = 0.0;
						// TODO: handle exception
					}
					try {
						sugar = (Double) nutjs.getDouble("NUTR_CONT5");
					} catch (Exception e) {
						sugar = 0.0;
						// TODO: handle exception
					}
					try {
						natrium = (Double) nutjs.getDouble("NUTR_CONT6");
					} catch (Exception e) {
						natrium = 0.0;
						// TODO: handle exception
					}
					try {
						chole = (Double) nutjs.getDouble("NUTR_CONT7");
					} catch (Exception e) {
						chole = 0.0;
						// TODO: handle exception
					}
					try {
						fattyacid = (Double) nutjs.getDouble("NUTR_CONT8");
					} catch (Exception e) {
						fattyacid = 0.0;
						// TODO: handle exception
					}
					try {
						transfat = (Double) nutjs.getDouble("NUTR_CONT9");
					} catch (Exception e) {
						transfat = 0.0;
						// TODO: handle exception
					}

					String manufacturer = nutjs.getString("ANIMAL_PLANT");

					String material = infojs.getString("rawmtrl");

					String img = infojs.getString("imgurl2");

					 String imgname = FileUrlDownload.fileUrlDownload(img, "./src/main/resources/static/img");

					 img ="img/"+imgname;
					Food food = new Food(codenum++, name, supportpereat, calory, carbo, protein, fat, sugar, natrium,
							chole, fattyacid, transfat, manufacturer, material, img, "", 0);

					res.put(food.getName(), food);
					//System.out.println(food);
					
				}

			}
			
		}
		//System.out.println("데이터 개수 : "+testcnt);
		return res;

	}
}