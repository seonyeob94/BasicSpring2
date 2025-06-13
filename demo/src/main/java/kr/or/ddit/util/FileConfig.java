package kr.or.ddit.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.slf4j.Slf4j;

//스프링에게 설정 파일임을 알려주자
@Slf4j
@Configuration
public class FileConfig implements WebMvcConfigurer {
 /*   웹 주소와 파일의 위치 매핑
    주소줄에 이렇게 쓰면 /upload/2025/02/20/개똥이.jpg
    C:/upload/2025/02/20/개똥이.jpg
  */
	//부모 메소드 재정의
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		log.info("addResourceHandlers 실행!");
		// localhost/upload/개똥이.jsp
		registry.addResourceHandler("/upload/**")
				.addResourceLocations("file:///C:/upload/");
	}
	
}