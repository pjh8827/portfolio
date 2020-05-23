import React, { ReactElement, MouseEvent } from 'react'
import categoryIcon from 'assets/images/categoryIcon.png'
import 'components/category/category.scss';
import { inject, observer } from "mobx-react";

interface Props {
    searchMerchantByCategory? : (category: string)=>void
}

function Category({searchMerchantByCategory}: Props): ReactElement {
    const handleIconClick = (event : any) =>{
        const className = event.target.className;
        let category = "";
        if(className.includes('item1')){
            category = "음식";
        }else if(className.includes('item2')){
            category = "유통업";
        }else if(className.includes('item3')){
            category = "연료";
        }else if(className.includes('item4')){
            category = "학원";
        }else if(className.includes('item5')){
            category = "병원";
        }else if(className.includes('item6')){
            category = "의료";
        }else if(className.includes('item7')){
            category = "레저";
        }else if(className.includes('item8')){
            category = "보건";
        }
        if(category !== ""){
            searchMerchantByCategory!(category);
        }
    }
    return (
        <div id="category" onClick={handleIconClick}>
            <div className="menu item1"><div className="item-title">음식점</div></div>
            <div className="menu item2"><div className="item-title">편의점</div></div>
            <div className="menu item3"><div className="item-title">주유소</div></div>
            <div className="menu item4"><div className="item-title">학원</div></div>
            <div className="menu item5"><div className="item-title">병원</div></div>
            <div className="menu item6"><div className="item-title">기타의료기관</div></div>
            <div className="menu item7"><div className="item-title">레저업소</div></div>
            <div className="menu item8"><div className="item-title">보건위생</div></div>
        </div>
    )
}


export default inject(({ merchant }) => ({
    searchMerchantByCategory : merchant.searchMerchantByCategory,
  }))(observer(Category));
  