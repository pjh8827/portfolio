import React from 'react';
import 'mobx/BasketItem.scss';
import { observer } from 'mobx-react';

interface Props {
    item: {
        name: string;
        price: number;
        count: number;

    };
    onTake: (name: string) => {}
}

const BasketItem = ({ item, onTake }: Props) => {
    return (
        <div className="BasketItem">
            <div className="name">{item.name}</div>
            <div className="price">{item.price}원</div>
            <div className="count">{item.count}</div>
            <div className="return" onClick={() => onTake(item.name)}>갖다놓기</div>
        </div>
    );
}

export default observer(BasketItem);