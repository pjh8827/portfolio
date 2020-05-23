import React, { ReactElement, useState } from "react";
import { InputBase, Button } from "@material-ui/core";
import { inject, observer } from "mobx-react";

import "components/search/search.scss";

interface Props {
  searchMerchantBySearchInput?: (searchInput: string) => {}
}

function Search({ searchMerchantBySearchInput }: Props): ReactElement {
  const [searchInput, setSearchInput] = useState("");
  const handleSearchInputChange = (event: any) => {
    setSearchInput(event.target.value);
  }
  const handleBtnClick = (event: any) => {
    event.preventDefault();
    searchMerchantBySearchInput!(searchInput);
  }
  const handleKeyDown = (event: any) => {
    if (event.keyCode == 13) {
      searchMerchantBySearchInput!(searchInput);
    }
  }

  return (
    <div id="search-wrap">
      <div id="search-input">
        <InputBase placeholder="검색어를 입력해주세요." fullWidth style={{ height: "40px" }} onChange={handleSearchInputChange} onKeyDown={handleKeyDown} />
      </div>
      <div id="search-button">
        <Button variant="contained" color="primary" component="span" onClick={handleBtnClick}>
          검색
        </Button>
      </div>
    </div>
  );
}

export default inject(({ merchant }) => ({
  searchMerchantBySearchInput: merchant.searchMerchantBySearchInput,
}))(observer(Search));
