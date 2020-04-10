package com.ssafy.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
/*
식품 섭취 기록
*/
public class EatList {

    private Integer no;//일일 섭취기록 번호(index)
    private String id; //사용자 id
    private Integer code; //식품코드
    private Integer cnt; //섭취횟수
    private String eatdate; //섭취일


}