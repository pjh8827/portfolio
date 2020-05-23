import React, { ReactElement } from "react";
import { inject, observer } from "mobx-react";

import LetsMap from "components/letsmap/LetsMap";
import "pages/mappage/mappage.scss";
import StoreCardList from "components/storecard/StoreCardList";
import Header from "components/header/Header";

interface Props {
  updateMerchantList? : ()=>{};
}

function MapPage({updateMerchantList}: Props): ReactElement {
  // updateMerchantList!();
  return (
    <div className="map-page">
      <div className="header">
        <Header />
      </div>
      {/* 안녕 */}
      <div className="list-area">
        <StoreCardList />
      </div>
      <div className="map-area">
        <LetsMap />
      </div>
    </div>
  );
}

export default inject(({ merchant }) => ({
  updateMerchantList : merchant.updateMerchantList,
}))(observer(MapPage));

