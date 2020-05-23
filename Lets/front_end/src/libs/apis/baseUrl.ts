export default ()=>{
    if( process.env.NODE_ENV == 'production' ) {
        return "http://k02a1011.p.ssafy.io:8080/api";
    } else if( process.env.NODE_ENV == 'development' ){
        return "http://localhost:8080/api";
    }
    return "http://localhost:8080/api";
};