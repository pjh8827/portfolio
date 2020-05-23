import React, { ReactElement } from 'react'
import { observer, inject } from 'mobx-react';

interface Props {
    total?: number;
}

const TotalPrice = ({total}: Props): ReactElement => {
        return (
            <div>
                <hr />
                <p>
                    <b>총합: </b> {total}원
                    </p>
            </div>
        )
}

export default inject(({ market })=>({
    total : market.total
}))(observer(TotalPrice));