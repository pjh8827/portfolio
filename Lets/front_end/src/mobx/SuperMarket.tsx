import React from 'react';
import SuperMarketTemplate from 'mobx/SuperMarketTemplate';
import ShopItemList from 'mobx/ShopItemList';
import BasketItemList from 'mobx/BasketItemList';
import TotalPrice from 'mobx/TotalPrice'
const SuperMarket = () => {
    return <SuperMarketTemplate
        items={<ShopItemList />}
        basket={<BasketItemList />}
        total={<TotalPrice />} />;
}

export default SuperMarket;