<strong>readme.md</strong>


# 관통프로젝트: SafeFood_Web_Spring
### 참여 페어
- 신동민
- 박정환
- 

### 처리된 요구사항 목록
|난이도|구현기능|세부기능|작성여부|
|:---:|:---:|---|:---:|
|기본|식품정보 관리|메인페이지|O|
|기본|식품정보 관리|식품명검색|O|
|기본|식품정보 관리|식품 목록 검색|O|
|기본|식품정보 관리|식품 상세 검색|O|
|기본|식품정보 관리|메인페이지|O|
|기본|회원정보관리|회원정보등록|O|
|기본|회원정보관리|회원정보검색|O|
|기본|회원정보관리|회원정보수정|O|
|기본|회원정보관리|회원정보삭제|O|
|기본|회원정보관리|로그인&로그아웃|O|
|추가|식품 목록 검색|첫글자입력시 목록미리보기|O|
|추가|식품 목록 검색|식품별 검색빈도(조회수) 관리|O|
|추가|회원정보관리|회원별 섭취 식품 CRUD|X|
|심화|공지사항|공지사항 등록 |O|
|심화|공지사항|공지사항 수정 |O|
|심화|공지사항|공지사항 검색 |O|
|심화|공지사항|공지사항 삭제 |O|

### 클래스 다이어그램

#### 공지사항기능에 관여하는 클래스 다이어그램
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/%EA%B3%B5%EC%A7%80%EA%B8%B0%EB%8A%A5%EA%B4%80%EB%A0%A8%ED%81%B4%EB%9E%98%EC%8A%A4%EB%8B%A4%EC%9D%B4%EC%96%B4%EA%B7%B8%EB%9E%A8.PNG">

#### 회원정보관리기능에 관여하는 클래스 다이어그램
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/%EC%8B%9D%ED%92%88%EA%B8%B0%EB%8A%A5%EA%B4%80%EB%A0%A8%20%ED%81%B4%EB%9E%98%EC%8A%A4%EB%8B%A4%EC%9D%B4%EC%96%B4%EA%B7%B8%EB%9E%A8.PNG">

#### 식품정보관리기능에 관여하는 클래스 다이어그램
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/%ED%9A%8C%EC%9B%90%EA%B8%B0%EB%8A%A5%EA%B4%80%EB%A0%A8%ED%81%B4%EB%9E%98%EC%8A%A4%EB%8B%A4%EC%9D%B4%EC%96%B4%EA%B7%B8%EB%9E%A8.PNG">


### 실행화면 캡쳐

#### 메인페이지
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80.PNG">

## 식품관련기능

#### 식품정보 전체리스트
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EC%8B%9D%ED%92%88%EC%A0%95%EB%B3%B4%20%EC%A0%84%EC%B2%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8.PNG">

#### 식품정보 검색(식품명, 제조사 , 원재료)
식품정보를  [식품명, 제조사 , 재료] 조건으로 검색하며
검색할때 첫글자입력시 검색결과목록 미리보기 기능을 제공합니다.

#### 식품명 검색
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EC%8B%9D%ED%92%88%EC%9D%B4%EB%A6%84%EA%B2%80%EC%83%89.PNG">

#### 제조사 검색
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EC%A0%9C%EC%A1%B0%EC%82%AC%EA%B2%80%EC%83%89.PNG">

#### 식품원재료 검색
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EC%9E%AC%EB%A3%8C%EA%B2%80%EC%83%89.PNG">

### 식품정보 상세페이지
식품정보를 검색하여 클릭하면 해당 식품에 대한 상세한 정보를 확인할 수 있습니다.

<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EC%8B%9D%ED%92%88%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%801.PNG">

#### 영양정보 그래프
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EC%8B%9D%ED%92%88%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%802%EA%B7%B8%EB%9E%98%ED%94%84.PNG">

#### 해당 식품과 영양구성이 유사한 다른 식품 추천
영양분 구성비율을 비교하여 해당 식품과 비슷한 다른 식품들을 추천해주는 기능
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EC%8B%9D%ED%92%88%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%803%EC%9C%A0%EC%82%AC%EC%8B%9D%ED%92%88%20%EA%B2%80%EC%83%89.PNG">


## 회원관련기능

### 회원가입 폼
회원가입 시 개인 알러지 리스트 저장기능 구현
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%ED%8F%BC.PNG">
### 회원가입 성공
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%EC%84%B1%EA%B3%B5.PNG">
 
### 로그인성공
로그인 세션 생성에 따른 네이비게이션 바 메뉴 변경
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EB%A1%9C%EA%B7%B8%EC%9D%B8%EC%84%B1%EA%B3%B5-%EB%A1%9C%EA%B7%B8%EC%9D%B8%EC%84%B8%EC%85%98.PNG">

### 회원정보 열람 및 수정 폼
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%ED%9A%8C%EC%9B%90%EC%A0%95%EB%B3%B4%EC%97%B4%EB%9E%8C%EB%B0%8F%EC%88%98%EC%A0%95.PNG">

### 회원정보 수정 성공
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EC%88%98%EC%A0%95%EC%84%B1%EA%B3%B5.PNG">

### 회원탈퇴 성공 
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%ED%9A%8C%EC%9B%90%ED%83%88%ED%87%B4%EC%84%B1%EA%B3%B51.PNG">

### 회원탈퇴 성공(DB 캡처) 
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%ED%9A%8C%EC%9B%90%ED%83%88%ED%87%B4%EC%84%B1%EA%B3%B52.PNG">

## 공지사항 기능

### 공지사항 등록창(create)
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EB%93%B1%EB%A1%9D%EC%B0%BD.PNG">

### 공지사항 게시판
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EA%B2%8C%EC%8B%9C%ED%8C%90.PNG">

### 공지사항 보기(read)
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EB%B3%B4%EA%B8%B0.PNG">


### 공지사항 수정(update)
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EC%88%98%EC%A0%95%EC%99%84%EB%A3%8C.PNG">

### 공지사항 삭제(delete)
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EC%82%AD%EC%A0%9C.PNG">


### 공지사항 검색
제목과 내용으로 검색 가능
### 공지사항 검색 - 제목
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EB%82%B4%EC%9A%A9%EA%B2%80%EC%83%89.PNG">
### 공지사항 검색 - 내용
<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EB%82%B4%EC%9A%A9%EA%B2%80%EC%83%89.PNG">

<img src="https://lab.ssafy.com/sdm821/safefoodspringboot/raw/master/image/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EB%82%B4%EC%9A%A9%EA%B2%80%EC%83%892.PNG">



