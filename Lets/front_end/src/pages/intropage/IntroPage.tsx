import React, { ReactElement } from 'react'
import Button from '@material-ui/core/Button';
import { Map } from '@material-ui/icons';
import { Link, useHistory } from 'react-router-dom';
import { useCookies } from 'react-cookie';
import 'pages/intropage/intropage.scss';

interface Props {

}

export default function HomePage({ }: Props): ReactElement {
    const [cookies, setCookie, removeCookie] = useCookies(['introSkip']);
    const history = useHistory();
    if(cookies.introSkip !== undefined){
        history.push('/map');
    }else{
        const expiresDate = new Date();
        expiresDate.setHours(23);
        expiresDate.setMinutes(59);
        expiresDate.setSeconds(59);
        console.log(expiresDate);
        setCookie('introSkip', true, {expires : expiresDate});
    }
    return (
        <div className="intro-wrap">
            <div className="intro-content">
                안녕
                <div className="intro-title">
                    LETS 경기
                <div className='intro-sub-title'>Local Exchange Trading System</div>
                </div>
                <div className='intro-introduction'>
                    여기는 대략적인 설명문이 들어가는 위치입니다.<br />
                    여기는 대략적인 설명문이 들어가는 위치입니다.<br />
                    여기는 대략적인 설명문이 들어가는 위치입니다.<br />
                </div>
                <Link to='/map'>
                    <div className="intro-map-icon" >
                        <div className="intro-map-icon-content">
                            <Map className="icon" /><br />
                            <div className="text">
                                지도로 가기
                        </div>
                        </div>
                    </div>
                </Link>
            </div>
            <div className="intro-footer">
                data.go.kr , kakao map api
            </div>
        </div>
    )
}
