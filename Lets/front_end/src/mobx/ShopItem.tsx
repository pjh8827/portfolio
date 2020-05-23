import React from 'react';
import './ShopItem.scss';

interface Props {
    name: string;
    price: number;
    onPut: (name: string, price: number) => {}
}
const ShopItem = ({ name, price, onPut }: Props) => {
    return (
        <div className="ShopItem" onClick={() => onPut(name, price)}>
            <h4>{name}</h4>
            <div>{price}원</div>
        </div>
    );
};

export default ShopItem;