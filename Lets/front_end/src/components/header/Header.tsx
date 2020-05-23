import React, { ReactElement, Fragment } from "react";
import "components/header/header.scss";
import Search from "components/search/Search";
import Category from "components/category/Category";
import { useCookies } from 'react-cookie';
interface Props { }

export default function Header({ }: Props): ReactElement {
  const [cookies, setCookie, removeCookie] = useCookies(['introSkip']);
  const handleOnClick = (event : any) =>{
    removeCookie('introSkip');
    window.location.href = "/";
  }
  return (
    <Fragment>
      <div id="header-wrap">
          <div id="header-title" onClick={handleOnClick}>
            LETS 경기
          <div id="header-sub-title">Local Exchange Trading System</div>
          </div>
        <div id="header-search">
          <Search />
        </div>
        <div id="header-category">
          <Category />
        </div>
      </div>
    </Fragment>
  );
}
