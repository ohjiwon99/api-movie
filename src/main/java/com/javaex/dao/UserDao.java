package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
    
    @Autowired
    private SqlSession sqlSession;

    public List<UserVo> userList(String phoneNumber) {
        System.out.println("UserDao.userList()");
        try {
            List<UserVo> userList = sqlSession.selectList("user.list", phoneNumber);
            return userList;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("데이터베이스에서 유저 목록을 가져오는 데 실패했습니다.");
        }
    }
}
