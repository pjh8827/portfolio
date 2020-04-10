package com.ssafy;

import com.ssafy.Additional.CoupangApiConfig;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
@EnableTransactionManagement
@EnableConfigurationProperties(CoupangApiConfig.class)
public class SafeFoodSpringBootApplication implements WebMvcConfigurer  {

	public static void main(String[] args) {
		SpringApplication.run(SafeFoodSpringBootApplication.class, args);
		
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		//registry.addResourceHandler("/**").addResourceLocations("/resources/");
		registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
		registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");

	}

}
