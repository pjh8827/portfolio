박정환 포트폴리오https://github.com/pjh8827/Portfolio

# 심봉사 (봉사활동  SNS)

-------------------     ----------------------------
나의 역할 :

> [DB 설계](#DB-설계)
>
> [Main Rest API](#Main-Rest-API)
>
> [Map Open API](#Map-Open-API)
>
> [JWT 인증 시퀀스](#JWT-인증-시퀀스)
>
> [Oauth 인증](#Oauth-인증)
>
> [AWS에 BackEnd 배포](#AWS-BackEnd-배포)

-------------------     ----------------------------

## DB 설계
---------

**DB ERD** 

![DB_ERD](https://github.com/pjh8827/Portfolio/blob/master/Simbongsa/readme_img/ERD.png?raw=true)



## Main Rest API
---------

(회원, 게시글, 댓글, 봉사활동)

Member Sequence Diagram

![Sequence Diagram](https://github.com/pjh8827/Portfolio/blob/master/Simbongsa/readme_img/Main%20Rest%20API.png?raw=true)

Member Class Diagram

![Class Diagram](https://github.com/pjh8827/Portfolio/blob/master/Simbongsa/readme_img/Main%20Class%20Diagram.PNG?raw=true)


## Map Open API
----------

Map Class Diagram

![Map_Class_Diagram](https://github.com/pjh8827/Portfolio/blob/master/Simbongsa/readme_img/Map%20Class%20Diagram.PNG?raw=true)

지도의 경도, 위도를 찾기 위한 기능으로 아래와 같은 방식으로 우리 서비스의 봉사활동 DB안에서 지도를 찾을만한 String 을 엮어 KakaoMap open api를 활용해 검색하는 방식으로 진행하였다. 로직을 아래와 같다.

> 1. 봉사활동 모든 정보를 가져온다.
> 2. 대괄호, 소괄호 안의 문자열들을 분리하여 항목별로 저장한다.
> 3. 문자열 내에 지엽적이거나 검색에 방해가 될만한 요소들을 변환한다.
> 4. 검색 정확도가 높은 순으로 검색을 하여 결과값을 반환한다.(대괄호>소괄호>노멀) 

```java
@GetMapping("/findNow")
@ApiOperation("주소 정보를 반환한다.")
	public ResponseEntity<Map<String, Object>> getVol_detailnow() {
		try {
			//봉사활동 모든 정보 가져오기
			List<Vol> listVol = volService.searchAll();
			List<Regex> list = new ArrayList<Regex>();
			
			String address;
			String origin;
			String normal;
			String inner;
			String inner2;
			String temp2;
			List<Location> llist = new ArrayList<Location>();
			for(Vol v : listVol) {
				address="";
				origin="";
				normal="";
				inner="";
				inner2="";
				temp2="";
				
				Region region = regionService.searchRegion(v.getR_id());
				address = v.getV_location();
				if(!address.contains(region.getR_gugunNm())) address = region.getR_gugunNm()+" "+address;
				if(!address.contains(region.getR_sidoNm())) address = region.getR_sidoNm()+" "+address;
				
				address=address.replace("★", "");
				if(address.contains(",")) address = address.substring(0, address.lastIndexOf(","));
				if(address.contains(",")) address = address.substring(0, address.lastIndexOf(","));
				if(address.contains(",")) address = address.substring(0, address.lastIndexOf(","));
				
				origin = address;
				
				//문자열 뜯어내기(Outside)
				if(origin.contains("[")) {
					normal = origin.substring(0, origin.lastIndexOf("["));
				}else {
					normal = origin;
				}
				if(origin.contains("(")) {
					normal = origin.substring(0, origin.lastIndexOf("("));
					if(origin.contains(")")) normal+= origin.substring(origin.lastIndexOf(")")+1, origin.length());
				}
				if(normal.contains("(")) {
					normal = normal.substring(0, normal.lastIndexOf("("));
				    if(normal.contains(")")) normal+= normal.substring(normal.lastIndexOf(")")+1, normal.length());
				}
				
				//문자열 뜯어내기(Inside)
				if(origin.contains("(")) {
					inner = origin.substring(origin.lastIndexOf("(")+1);
					if(inner.contains(")")) {
						inner=inner.substring(0, inner.lastIndexOf(")"));
					}
					if(inner.contains(",")) inner = inner.substring(0, inner.lastIndexOf(","));
				}else {
					inner = "";
				}
				

				//문자열 뜯어내기(Inside 대괄호)
				if(origin.contains("[")) {
					inner2 = origin.substring(origin.lastIndexOf("[")+1);
					if(inner2.contains("]")) {
						inner2=inner2.substring(0, inner2.lastIndexOf("]"));
					}
					if(inner2.contains(",")) inner2 = inner2.substring(0, inner2.lastIndexOf(","));
				}else {
					inner2 = "";
				}
				//

				if(normal.contains("[")) {
					normal = normal.substring(0, normal.lastIndexOf("["))+normal.substring(origin.lastIndexOf("]")+1, normal.length());
				}
				
				normal=normal.replace(":", "").replace("사)", "").replace("*", "").replace(".", "");
				if(normal.contains("/")) normal = normal.substring(0, normal.lastIndexOf("/"));
				inner = inner.replace(":", "");
				inner = inner.replace("7층", "").replace("어린이집", "").replace("집결", "").replace(".", "").replace("당리동", "")
						.replace(")", "").replace("중동", "").replace("/", "").replace("1층", "").replace("사무실", "")
						.replace("지부사무실", "").replace("503호~509호", "").replace("상행선", "").replace("자양동", "").replace("정신보건팀", "")
						.replace("사", "").replace("동호동", "").replace("홈플러스 뒤편", "").replace("무실동", "").replace("내동", "").replace("  ", "")
						.replace("삼성동", "").replace("기관", "").replace("무실동", "").replace("2월 8일", "").replace("행궁점", "").replace("무실동", "")
						.replace("파장동", "").replace("매장", "").replace("2층", "").replace("네네치킨", "").replace("용인 인근", "").replace("4층", "")
						.replace("3층", "").replace("하대동", "").replace("지부", "").replace("장소", "").replace("신월동", "").replace("청운동", "")
						.replace("추후공지예정", "").replace("SNS", "").replace("화도-마석", "").replace("재택", "").replace("성석동", "").replace("금정동", "")
						.replace("협회 대표번호", "").replace("5층", "").replace("대림대학교 건너편", "").replace("주", "").replace("2관 4층", "").replace("지하", "")
						.replace("샘", "").replace("해운대구", "").replace("종합자료실", "").replace("서정동", "").replace("봉암리", "").replace("금곡동", "")
						.replace("로비 등", "").replace("실 내외", "").replace("광명동", "").replace("문예동", "").replace("출구밖 아님", "").replace("학교주변 및 우범지역", "")
						.replace("복지시설", "").replace("광광역시", "").replace("소 새롬로", "새롬로").replace("에 방이샤브샤브 음식점 있음", "").replace("정관읍행정복지센터 건너편", "")
						.replace("2관", "").replace("칠금동", "").replace("영운동", "").replace("E30", "").replace("경로식당", "").replace("충북대 부근", "")
						.replace("학교변 및 우범지역", "").replace("이예정", "").replace("교육실", "").replace("진산과학고등학교 맞은편", "").replace("앞", "").replace("사)", "");
				if(inner.equals("주")) inner="";
				if(inner.equals("상동")) inner="";
				
				
				inner2 = inner2.replace(":", "").replace("집결장소", "");
				Regex reg = new Regex();
				reg.setMid(address);
				reg.setNormal(normal);
				reg.setBig(inner2);
				reg.setSmall(inner);
				
				String[] nor = normal.split(" ");
				
				boolean check=false;
				//1순위 대괄호
				if(!inner2.equals("")&&!inner2.equals(" ")) {
					if(kakaoMap(inner2)!=null) {
						llist.add(kakaoMap(inner2));
						Location flocation = kakaoMap(inner2);
						v.setV_x(flocation.getX());
						v.setV_y(flocation.getY());			
						volService.update(v);
						
						check=true;
						continue;
					}
				}
				
				check=false;
				//2순위 소괄호
				if(!inner.equals("")) {
					if(kakaoMap(inner)!=null) {
						check=true;
						llist.add(kakaoMap(inner));
						Location flocation = kakaoMap(inner);
						v.setV_x(flocation.getX());
						v.setV_y(flocation.getY());
						volService.update(v);
						continue;
					}
				}
				
				check=false;
				//3순위 노멀
				if(!normal.equals("")) {
					String s1="";
					for(String s : nor) {
						s1+=s+" ";
					}
					if(s1.charAt(0)==' ') s1 = s1.substring(1);
					int size = nor.length;
					while(size>=1) {
						if(kakaoMap(s1)!=null) {
							check=true;
							llist.add(kakaoMap(s1));
							Location flocation = kakaoMap(s1);
							v.setV_x(flocation.getX());
							v.setV_y(flocation.getY());
							volService.update(v);
							break;
						}
						
						s1="";
						int time = size;
						for(String s : nor) {
							s1 += s+" ";
							if(time==1) break;
							time--;
						}
						size--;
					}
				}
			}
			return response(llist, true, HttpStatus.OK);
		} catch (Exception e) {
			logger.error("주소리스트조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
```



참조 글 : https://github.com/devdynam0507/KakaoMapRestAPI

## JWT 인증 시퀀스

--------------------

JWT Generate Sequence Diagram

![JWT_Generate](https://github.com/pjh8827/Portfolio/blob/master/Simbongsa/readme_img/jwt_sequence1.PNG?raw=true)

JWT Valiate Sequence Diagram

![JWT_Validate](https://github.com/pjh8827/Portfolio/blob/master/Simbongsa/readme_img/jwt_sequence2.PNG?raw=true)

JWT Class Diagram

![JWT_Class_Diagram](https://github.com/pjh8827/Portfolio/blob/master/Simbongsa/readme_img/jwt_class_diagram.PNG?raw=true)

사용한 곳

> 1. 회원 인증 처리
>
>    > ```java
>    > @RequestMapping(value = "/authenticate", method = RequestMethod.POST)
>    > 	public ResponseEntity<?> createAuthenticationToken(@RequestBody JwtRequest authenticationRequest) throws Exception {
>    > 
>    > 		authenticate(authenticationRequest.getUsername(), authenticationRequest.getPassword());
>    > 		final String email = authenticationRequest.getUsername();
>    > 		final int id = userDetailsService.loadUserIdByUsername(authenticationRequest.getUsername());
>    > 		final String userId = userDetailsService.loadUserNickByUsername(authenticationRequest.getUsername());
>    > 		final String token = jwtTokenUtil.generateToken(email, userId, id);
>    > 		Member member = memberDao.searchByEmail(email);
>    > 		
>    > 		if(member.getM_key().equals("Y"))
>    > 			return ResponseEntity.ok(new JwtResponse(token));
>    > 		else 
>    > 			return ResponseEntity.ok("EmailAuthenticateNeed");
>    > 	}
>    > 
>    > private void authenticate(String username, String password) throws Exception {
>    > 		try {
>    > 			System.out.println("이메일 : " + username);
>    > 			System.out.println("비밀번호 : " + password);
>    > 			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
>    > 		} catch (DisabledException e) {
>    > 			throw new Exception("USER_DISABLED", e);
>    > 		} catch (BadCredentialsException e) {
>    > 			throw new Exception("INVALID_CREDENTIALS", e);
>    > 		}
>    > 	}
>    > 
>    > public static final long JWT_TOKEN_VALIDITY = 24 * 60 * 60 * 365;
>    > 
>    > private String doGenerateToken(Map<String, Object> claims, String issuer, String subject, String audience) {
>    > 
>    > 		return Jwts.builder().setClaims(claims).setIssuer(issuer).setSubject(subject).setAudience(audience).setIssuedAt(new Date(System.currentTimeMillis()))
>    > 				.setExpiration(new Date(System.currentTimeMillis() + JWT_TOKEN_VALIDITY * 1000))
>    > 				.signWith(SignatureAlgorithm.HS512, secret).compact();
>    > 	}
>    > ```
>
> 2. 비밀번호 변경
>
>    >```Java
>    >// 비밀번호 변경 발송 이메일
>    >	public boolean mailSendForPassword(String m_email) {
>    >		Member member = memberDao.searchByEmail(m_email);
>    >		//토큰 발급
>    >		String passtoken = jwtTokenUtil.generateTokenPass(member.getM_email(), member.getM_userid(), member.getM_id());
>    >		
>    >		MimeMessage mail = javaMailSender.createMimeMessage();
>    >		String htmlStr = "<h2>안녕하세요 心봉사 입니다!</h2><br><br>" + "<h3>" + m_email.substring(0, m_email.lastIndexOf("@"))
>    >				+ "님</h3>" + "<p>변경하기 버튼을 누르시면 비밀번호를 변경하실 수 있습니다 : "
>    >				+ "<a href='http://i02a205.p.ssafy.io/changepassword/" + passtoken
>    >				+ "'>변경하기</a></p>" + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
>    >		try {
>    >			mail.setSubject("[본인인증] 心봉사님의 비밀번호 변경메일입니다", "utf-8");
>    >			mail.setText(htmlStr, "utf-8", "html");
>    >			mail.addRecipient(RecipientType.TO, new InternetAddress(m_email));
>    >			javaMailSender.send(mail);
>    >			return true;
>    >		} catch (MessagingException e) {
>    >			e.printStackTrace();
>    >			return false;
>    >		}
>    >
>    >	}
>    >
>    >public static final long JWT_TOKEN_VALIDITY_PASSWORD = 60 * 5;
>    >
>    >private String doGenerateTokenPass(Map<String, Object> claims, String issuer, String subject, String audience) {
>    >
>    >		return Jwts.builder().setClaims(claims).setIssuer(issuer).setSubject(subject).setAudience(audience).setIssuedAt(new Date(System.currentTimeMillis()))
>    >				.setExpiration(new Date(System.currentTimeMillis() + JWT_TOKEN_VALIDITY_PASSWORD * 1000))
>    >				.signWith(SignatureAlgorithm.HS512, secret).compact();
>    >	}
>    >```

참조 글 : https://www.javainuse.com/spring/boot-jwt

## Oauth 인증

----------------------------------------

Oauth2.0을 이용한 구글 소셜로그인

```java
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;

@RequestMapping(value = "/loginByGoogle", method = RequestMethod.POST)
	public ResponseEntity<?> saveUserG(@RequestBody String receive_idToken) throws Exception {

		final HttpTransport transport = new NetHttpTransport();
		final JacksonFactory jsonFactory = JacksonFactory.getDefaultInstance();

		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
				.setAudience(Collections.singletonList(MY_APP_GOOGLE_CLIENT_ID)).build();
		GoogleIdToken idToken;

		Member member = new Member();
		try {
			idToken = verifier.verify(receive_idToken);
			if (idToken == null) {
				System.out.println("토큰값이 없어요");
			}else {
				Payload payload = idToken.getPayload();

				// Print user identifier
				String email = payload.getEmail();
				//String userid = email.substring(0, email.lastIndexOf("@"));
				String userid = email.substring(0, email.lastIndexOf("@") + 1); //일단 유저아이디에도 이메일 또는 특수문자가 들어가게 함.
				member.setM_email(email);
				member.setM_userid(userid);
				Member mem = memberDao.searchByEmail(email);
				if (mem == null) {
					userDetailsService.saveByGoogle(member);
				}
				member = memberDao.searchByEmail(email);
			}
		} catch (GeneralSecurityException | IOException e) {
			e.printStackTrace();
		}
		final String email = member.getM_email();
		final int id = member.getM_id();
		final String userId = member.getM_userid();
		final String token = jwtTokenUtil.generateToken(email, userId, id);

		return ResponseEntity.ok(new JwtResponse(token));
	}
```



## AWS에 BackEnd 배포

----------------------------------------

1. AWS에 Docker 설치 -> Docker에 MySQL 설치 및 이미지화 -> MySQL 구동
2. AWS에 Tomcat 설치 -> Tomcat 구동
3. 로컬에서 Filzila를 이용해 FTP 방식으로 AWS에 WAR 전달
4. AWS Tomcat에 WAR 올려 BackEnd 배포 완료.
