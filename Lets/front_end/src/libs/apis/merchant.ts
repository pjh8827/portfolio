import axios from "axios";
import getBaseUrl from "libs/apis/baseUrl";

const baseUrl = getBaseUrl();

export const getMerchantList = async () => { // back end 연결 후 async 추가
  try {
    const response = await axios.get(`${baseUrl}/merchants`);
    return response.data;
    // return [
    //   {
    //     brnhstrmMnyUsePosblYn: null,
    //     cardMnyUsePosblYn: null,
    //     category: null,
    //     cmpnmNm: "발레나라2",
    //     id: 1,
    //     latitude: "37.673069059",
    //     longitude: "126.80090346",
    //     mobileMnyUsePosblYn: null,
    //     refineLotnoAddr: "",
    //     refineRoadnmAddr: "경기도 고양시 일산동구 숲속마을2로 113",
    //     refineZipCd: "10303",
    //     regionMnyNm: "고양시",
    //     sigun: "1",
    //     telno: "031-904-9822",
    //   },{
    //     brnhstrmMnyUsePosblYn: null,
    //     cardMnyUsePosblYn: null,
    //     category: "1",
    //     cmpnmNm: "무교동낙지이야기",
    //     id: 2,
    //     latitude: "37.670753419",
    //     longitude: "127.50414429",
    //     mobileMnyUsePosblYn: null,
    //     refineLotnoAddr: "",
    //     refineRoadnmAddr: "경기도 가평군 설악면 한서로124번길 12",
    //     refineZipCd: "12464",
    //     regionMnyNm: "가평군",
    //     sigun: "2",
    //     telno: "070-7796-7036",
    //   },{
    //     brnhstrmMnyUsePosblYn: null,
    //     cardMnyUsePosblYn: null,
    //     category: null,
    //     cmpnmNm: "윤선생영어교실",
    //     id: 3,
    //     latitude: "37.653572719",
    //     longitude: "126.79096142",
    //     mobileMnyUsePosblYn: null,
    //     refineLotnoAddr: "",
    //     refineRoadnmAddr: "경기도 고양시 일산동구 강촌로 157",
    //     refineZipCd: "10417",
    //     regionMnyNm: "고양시",
    //     sigun: "1",
    //     telno: "031-903-0002",
    //   }
    // ];
  } catch (error) {
    return error;
  }
};

export const getMerchantListByCategory = async (category : string) =>{
  try{
    const response = await axios.get(`${baseUrl}/categories/${category}`);
    return response.data;
  }catch(error){
    throw error;
  }
}

export const getMerchantListBySearch = async (searchInput : string) =>{
  try{
    const response = await axios.get(`${baseUrl}/merchants/${searchInput}`);
    return response.data;
  }catch(error){
    throw error;
  }
}
