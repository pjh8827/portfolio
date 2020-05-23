import React, { ReactElement, Component } from 'react'
import './SuperMarketTemplate.scss';
interface Props {
    items: ReactElement;
    basket: ReactElement;
    total: ReactElement;
}

export default function SuperMarketTemplate({ items, basket, total }: Props): ReactElement {
    return (
        <div className="SuperMarketTemplate">
            <div className="items-wrapper">
                <h2>상품</h2>
                {items}
            </div>
            <div className="basket-wrapper">
                <h2>장바구니</h2>
                {basket}
                {total}
            </div>
        </div>
    );
};