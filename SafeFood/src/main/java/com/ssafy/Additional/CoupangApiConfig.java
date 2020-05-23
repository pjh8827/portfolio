package com.ssafy.Additional;

import org.springframework.boot.context.properties.ConfigurationProperties;

import lombok.Data;

@ConfigurationProperties(prefix = "coupang.api")
@Data
public class CoupangApiConfig {

    private String accesskey;
    private String secretkey;


}