import axios from "axios";
import getBaseUrl from "libs/apis/baseUrl";

const baseUrl = getBaseUrl();

export const getMerchantList = async () => { // back end 연결 후 async 추가
  try {
    const response = await axios.get(`${baseUrl}/merchants`);
    return response.data;
  } catch (error) {
    return error;
  }
};

export const getMerchantListByCategory = async (category: string, currentLatLong: [number, number], topRightLatLong: [number, number], bottomLeftLatLong: [number, number], page: number, pageSize: number) => {
  try {
    // /merchants-by-category/{categoryType}/{bottomLeftLatitude}/{topRightLatitude}/{bottomLeftLongitude}/{topRightLongitude}/{page}/{size}
    const urlFormat = [`${baseUrl}/merchants-by-category/${category}/${currentLatLong[0]}/${currentLatLong[1]}/${bottomLeftLatLong[0]}/${topRightLatLong[0]}/${bottomLeftLatLong[1]}/${topRightLatLong[1]}/`
      , `/${pageSize}`];
    const response = await axios.get(`${urlFormat[0]}${page}${urlFormat[1]}`);
    return [urlFormat, response.data];
  } catch (error) {
    throw error;
  }
}

export const getMerchantListBySearch = async (searchInput: string, currentLatLong: [number, number], topRightLatLong: [number, number], bottomLeftLatLong: [number, number], page: number, pageSize: number) => {
  try {
    // console.log('aaaaaaaaaaaaa');
    // console.log(currentLatLong);
    // console.log(topRightLatLong);
    // console.log(bottomLeftLatLong);
    // console.log(pageSize);
    // console.log(page);
    const urlFormat = [`${baseUrl}/merchants-by-name/${searchInput}/${currentLatLong[0]}/${currentLatLong[1]}/${bottomLeftLatLong[0]}/${topRightLatLong[0]}/${bottomLeftLatLong[1]}/${topRightLatLong[1]}/`
      , `/${pageSize}`];
    // console.log('bbbbbbbbbbbbbb');

    const response = await axios.get(`${urlFormat[0]}${page}${urlFormat[1]}`);
    return [urlFormat, response.data];
  } catch (error) {
    // console.log(error);
    throw error;
  }
}

export const changePage = async (prevUrlFormat: [string, string], page: number) => {
  try {
    const url = `${prevUrlFormat[0]}${page}${prevUrlFormat[1]}`;
    const response = await axios.get(url);
    return response.data;
  } catch (error) {
    throw error;
  }
}
