package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;
    
    public List<UserVo> getUserList(String phoneNumber) {
        System.out.println("UserService.getUserList()");
        
        try {
            List<UserVo> userList = userDao.userList(phoneNumber);
            return userList;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("데이터베이스에서 유저 목록을 가져오는 데 실패했습니다.");
        }
    }
}
