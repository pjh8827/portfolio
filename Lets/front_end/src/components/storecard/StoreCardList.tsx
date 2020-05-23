import React, { ReactElement, useEffect, useRef, useState } from "react";
import StoreCard from "./StoreCard";
import { inject, observer } from "mobx-react";
import 'components/storecard/storecardlist.scss';

interface Props {
  merchants?: any;
}

function StoreCardList({ merchants }: Props): ReactElement {
  const [merchartList, setMerchantList] = useState([]);

  useEffect(()=>{
    const merchantlist = merchants.map((merchant: any)=><StoreCard key={merchant.id} store={merchant} />);
    setMerchantList(merchantlist);
  },[merchants]);
  return (<div className="merchant-list">
    {merchartList.length>0 ? 
    <div>{merchartList}</div>
    :
    <div>가게 없음</div>}
    </div>
  );
}

export default inject(({ merchant }) => ({
  merchants: merchant.merchantList,
}))(observer(StoreCardList));
