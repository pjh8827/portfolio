import React, { ReactElement, useRef, useState, useEffect } from "react";
import { inject, observer } from "mobx-react";
import "components/letsmap/letsmap.scss";
import MarketStore from "stores/market";
import * as merchantApi from 'libs/apis/merchant';

interface Props {
  stores?: any;
  updateStores?: () => {};
}

const { kakao } = window;

const LetsMap = ({ stores, updateStores }: Props): ReactElement => {
  const mapContainer = useRef();
  const [kakaoMap, setKakaoMap] = useState<any>(null);
  const [markers, setMarkers] = useState<any[]>([]);

  // componentDidMount
  useEffect(() => {
    kakao.maps.load(() => {
      const el = document.getElementById("lets-map");
      const map = new kakao.maps.Map(el, {
        center: new window.kakao.maps.LatLng(37.51973, 127.008502), // 지도의 중심좌표.
        level: 11, // 지도의 레벨(확대, 축소 정도)
        scrollwheel: true, // 마우스 휠 확대/축소 가능
      });
      setKakaoMap(map);
    });
  }, []); // 빈 리스트 [] 를 넣으면 처음에 한 번만 실행됨.

  // componentDidUpdate 
  // 가게 리스트 정보 업데이트
  useEffect(() => {
    // 기존 마커 지우기
    markers.forEach(marker=>{
      marker.setMap(null);
    })
    // 새로운 마커 등록하기
    let tempMarkers = [] as any;
    kakao.maps.load(() => {
      stores.forEach((store: any) => {
        let marker = new kakao.maps.Marker({
          // map: volMap, // 마커를 표시할 지도
          position: new kakao.maps.LatLng(store.latitude, store.longitude), // 마커의 위치
          title: "hi",
        });
        tempMarkers.push(marker);
      })
    })
    setMarkers(tempMarkers);
  }, [kakaoMap, stores]); // kakaoMap이 완성되거나, stores가 업데이트 될 때 호출

  // 가게 정보 리스트 업데이트 되면 마커도 맵에 반영
  useEffect(()=>{
    // 마커 변경됐으면 다시 지도에 찍어주기
    markers.forEach(marker=>{
      marker.setMap(kakaoMap);
    });
  },[markers]);
  return (
    <div id="lets-map-wrap">
      <div id="lets-map" />
    </div>
  );
};

export default inject(({ letsMap, merchant }) => ({
  stores: merchant.merchantList,
  updateStores: merchant.updateMerchantList,
}))(observer(LetsMap));
