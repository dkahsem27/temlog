package com.temlog;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.ObjectUtils;

@SpringBootTest
class TemlogApplicationTests {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Test
	void contextLoads() {
	}

	@Test
	void 더하기테스트() {
		log.debug("######### 더하기테스트 수행");
		
		int a = 10;
		int b = 20;
		assertEquals(30, a + b);
	}
	
	@Test
	void 테스트() {
		String a = "";
		String b = null;
		List<Integer> list = null;
		List<Integer> list1 = new ArrayList<>(); // []
		
		if (ObjectUtils.isEmpty(list1)) {
			log.info("##### b is empty");
		}
	}
}
