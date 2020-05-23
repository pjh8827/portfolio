import CounterStore from 'stores/counter';
import MarketStore from 'stores/market';
import LetsMapStore from 'stores/letsMap';
import MerchantStore from 'stores/merchant';

class RootStore{
    counter : CounterStore;
    market : MarketStore;
    letsMap : LetsMapStore;
    merchant : MerchantStore;
    constructor(){
        this.counter = new CounterStore(this);
        this.market = new MarketStore(this);
        this.letsMap = new LetsMapStore(this);
        this.merchant = new MerchantStore(this);
    }
}

export default RootStore;