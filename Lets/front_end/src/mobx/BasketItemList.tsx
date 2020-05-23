import React from 'react';
import BasketItem from 'mobx/BasketItem';
import { inject, observer } from 'mobx-react';

interface Props {
    items?: any;
    onTake?: () => {}
}

const BasketItemList = ({ items, onTake }: Props) => {
    const itemList = items.map((item: any) => (
        <BasketItem
            item={item}
            key={item.name}
            onTake={onTake!}
        />
    ))
    return (
        <div>
            {itemList}
        </div>
    );
};

export default inject(({ market }) => ({
    items: market.selectedItems,
    onTake: market.take,
}))(observer(BasketItemList));