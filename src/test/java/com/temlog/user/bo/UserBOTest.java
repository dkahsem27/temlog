package com.temlog.user.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.temlog.user.model.User;

@SpringBootTest
class UserBOTest {

	@Autowired
	UserBO userBO;
	
	@Transactional
	//@Test
	void 유저추가테스트() {
		userBO.addUser("test222", "12341234");
	}
	
	@Test
	void 유저가져오기() {
		User user = userBO.getUserByLoginIdAndPassword("test111", "12341234");
		assertNotNull(user);
	}

}
