import React, { ReactElement, Fragment, useState } from "react";
import "components/header/header.scss";
import Search from "components/search/Search";
import Category from "components/category/Category";
import { useCookies } from 'react-cookie';
interface Props { }

export default function Header({ }: Props): ReactElement {
  const [cookies, setCookie, removeCookie] = useCookies(['introSkip']);
  const [ subTitleVisibleHidden, setSubTitleVisibleHidden ] = useState<string>('hidden');
  const handleOnClick = (event: any) => {
    removeCookie('introSkip');
    window.location.href = "/";
  }
  const handleTitleMouseOver = () => {
    setSubTitleVisibleHidden('visible');
  }
  const handleTitleMouseOut = () => {
    setSubTitleVisibleHidden('hidden');
  }
  return (
    <Fragment>
      <div className="header-wrap">
        <div className={`header-title`} onClick={handleOnClick} onMouseOver={handleTitleMouseOver} onMouseOut={handleTitleMouseOut}>
          LETS 경기
          <div className={`header-sub-title ${subTitleVisibleHidden}`}>Local Exchange Trading System</div>
        </div>
      </div>
    </Fragment>
  );
}
