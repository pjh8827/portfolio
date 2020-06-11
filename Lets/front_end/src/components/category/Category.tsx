import React, { ReactElement, MouseEvent } from 'react'
import categoryIcon from 'assets/images/categoryIcon.png'
import 'components/category/category.scss';
import { inject, observer } from "mobx-react";
import ReactGA from 'react-ga';
interface Props {
    searchMerchantByCategory?: (category: string, currentLatLong: [number, number], topRightLatLong: [number, number], bottomLeftLatLong: [number, number], page: number, pageSize: number) => void;
    currentLatLong?: [number, number];
    currentBound?: { bottomLeftLatLong: [number, number], topRightLatLong: [number, number] };
}

function Category({ searchMerchantByCategory, currentLatLong, currentBound }: Props): ReactElement {
    const handleIconClick = (event: any) => {
        // 여기부터
        const className = event.target.className;
        const classes: string[] = className.split(' ');
        let category = "";
        classes.forEach((c: string) => {
            if (c.includes('item')) {
                let idx = parseInt(c.split('item')[1]);
                category = cateList[idx];
            }
        });
        // 여기까지 카테고리 찾기
        if (category !== "") {
            // console.log(category);
            searchMerchantByCategory!(category, currentLatLong!, currentBound!.topRightLatLong, currentBound!.bottomLeftLatLong, 1, 20);
        }
    }
    const cateList: string[] = ["음식점", "편의점", "주유소", "학원", "병원", "레저업소", "보건위생", "기타"];

    return (
        <div id="category">
            {cateList.map((category, idx) => {
                return (
                    <div className={`menu item${idx}`} key={idx} onClick={(event: any) => {
                        handleIconClick(event);
                        ReactGA.ga('send', 'event', 'event_category', category, 'event_label');
                    }}>
                        <div className="item-title">{category}</div>
                    </div>
                )
            })}
        </div>
    )
}


export default inject(({ merchant, letsMap }) => ({
    searchMerchantByCategory: merchant.searchMerchantByCategory,
    currentLatLong: letsMap.currentLatLong,
    currentBound: letsMap.currentBound,
}))(observer(Category));
