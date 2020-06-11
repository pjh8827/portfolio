import React, { ReactElement, useEffect } from "react";
import { inject, observer } from "mobx-react";

import LetsMap from "components/letsmap/LetsMap";
import "pages/mappage/mappage.scss";
import StoreCardList from "components/storecard/StoreCardList";
import Header from "components/header/Header";
import SearchList from 'components/searchlist/SearchList';
import MerchantInfoCard from 'components/merchantinfo/MerchantInfoCard';

interface Props {
  updateMerchantList?: () => {};
}
function MapPage({ updateMerchantList }: Props): ReactElement {
  // updateMerchantList!();
  useEffect(() => {
    return () => {
    }
  }, [])
  return (
    <div className="map-page">
      {/*
      <div className="header">
        <Header />
      </div>
      <div className="list-area">
        <StoreCardList />
      </div>*/}
      <div className="map-area">
        <LetsMap />
      </div>
      <div className="search-list">
        <SearchList />
      </div>
      <div className="store-info">
        <MerchantInfoCard />
      </div>
    </div>
  );
}

export default inject(({ merchant }) => ({
  updateMerchantList: merchant.updateMerchantList,
}))(observer(MapPage));

