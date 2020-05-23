import { observable, action, computed } from 'mobx';

export default class MarketStore {
    @observable selectedItems = [] as any;
    root: any;

    // *** root 등록 constructor
    constructor(root: any = null) {
        this.root = root;
    }

    @action
    put = (name: string, price: number) => {
        const { number } = this.root.counter;
        // 존재하는지 찾고
        const exists = this.selectedItems.find((item: any) => item.name === name);
        if (!exists) {
            // 존재하지 않는다면 새로 집어넣습니다.
            this.selectedItems.push({
                name,
                price,
                count: number,
            });
            return;
        }
        // 존재 한다면 count 값만 올립니다.
        exists.count += number;
    }

    @action
    take = (name: string) => {
        const itemToTake = this.selectedItems.find((item: any) => item.name === name);
        itemToTake.count--;
        if (itemToTake.count === 0) {
            // 갯수가 0이면
            this.selectedItems.remove(itemToTake); // 배열에서 제거 처리합니다.
        }
    }

    @computed
    get total() {
        console.log('총합 계산...');
        return this.selectedItems.reduce((previous: number, current: any) => {
            return previous + current.price * current.count;
        }, 0);
    }
}