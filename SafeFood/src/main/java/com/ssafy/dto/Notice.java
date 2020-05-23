package com.ssafy.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {

	Integer no;
	String id;
	String title;
	String content;
	Integer viewcnt;

}
